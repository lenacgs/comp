#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CHILDREN 500

typedef struct node {
	struct node * children[MAX_CHILDREN]; //list of children of this node
	int number_children; //to access the next empty child
	struct node * bro;
	struct node * parent;
	char * type;
	char * value;
	char * annotation;
	int line;
	int column;
} node;
 
struct node * create_node (char * type, char * name, int line, int column);
struct node * create_node_2 (char * type);
struct node * add_sibling (struct node * s1, struct node * s2);
struct node * add_child(struct node * parent, struct node * child);
int get_number_siblings(struct node * node);
void print_node(struct node * root, int depth);
void print_annotated_node(struct node * root, int depth);
void annotate_node(struct node * node, char * annotation);
void annotate_tree(struct node * node);

extern struct node * root;