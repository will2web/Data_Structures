const std = @import("std");
const debug_print = std.debug.print;

const Node = struct {
    value: u8,
    next_node_pointer: u8,
};

pub fn main() !void {
    //ask user 1st value
    //call createLinkedList using that value

}

// Create Linked List (basically, Create 1st node)
fn createLinkedList(first_value: u8) !void {
    //create linked list with 1st node
    createNode(first_value, null);
    //therefore call createNode
}

fn createNode(node_value: u8, node_pointer: usize) !Node {
    const new_Node: Node = .{ node_value, node_pointer };
    return new_Node;
}

fn firstNode() !void {}
//returns 1st node (so it needs to be save somewhere...)

fn insertNode() !void {}
// Insertion: Adding a new node to the list, either at the beginning, end, or a specific position.

fn deleteNode() !void {}
// Deletion: Removing a node from the list, again at the beginning, end, or a specific position.

fn traverseLinkedList() !void {}
// Traversal: Accessing each node in the list, usually sequentially.

fn searchLinkedList() !void {}
// Search: Finding a specific node based on its data value or position.

fn sortLinkedList() !void {}
// Sort: Ordering the nodes in the list based on their data values.
