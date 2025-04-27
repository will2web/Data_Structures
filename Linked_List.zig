const std = @import("std");
const debug_print = std.debug.print;

const Node = struct {
    value: u8,
    next_node_pointer: ?*Node,
};

pub fn main() !void {
    // const Node = struct {
    //     value: u8,
    //     next_node_pointer: ?*Node,
    // };

    //(in later versions) ask user 1st value
    //call createLinkedList using that value
    const Node1 = createNode(87, null);
    debug_print("Node1: {any}\n\n", .{Node1});
    debug_print("@typeInfo(Node1) {any}", .{@typeInfo(Node1)});
    //    try debug_print("value1: {d}", .{Node1.value});
    //try debug_print("next_node_pointer: {any}", .{Node1.next_node_pointer});

    // const Node2 = createNode(17, &Node1);
    // debug_print("Node2: {any}", .{Node2});
}

// Create Linked List (basically, Create 1st node)
fn createLinkedList(first_value: u8) !void {
    //create linked list with 1st node; therefore call createNode
    createNode(first_value, null);
}

fn createNode(node_value: u8, node_pointer: ?*Node) !Node {
    const new_Node: Node = .{ .value = node_value, .next_node_pointer = node_pointer };
    //const new_Node: Node = .{ node_value, node_pointer };
    debug_print("new_Node.value: {any} \n", .{new_Node.value});
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
