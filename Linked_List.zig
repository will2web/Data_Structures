const std = @import("std");
const debug_print = std.debug.print;

const Node = struct {
    value: i8,
    //Should next node pointer point to a node, or another pointer?
    next_node_pointer: ?*Node,
};

pub fn main() !void {
    var head_Node: Node = undefined;
    var Node1: Node = .{ .value = 87, .next_node_pointer = null };
    //TRACK HEAD NODE
    head_Node = Node1;
    var Node2: Node = .{ .value = 17, .next_node_pointer = &Node1 };
    head_Node = Node2;
    var Node3: Node = .{ .value = 3, .next_node_pointer = &Node2 };
    head_Node = Node3;
    // debug_print("Node3: {any}\n", .{Node3});
    var Node4: Node = .{ .value = 23, .next_node_pointer = &Node3 };
    head_Node = Node4;
    // debug_print("Node4: {any}\n", .{Node4});
    var Node5: Node = .{ .value = 9, .next_node_pointer = &Node4 };
    head_Node = Node5;
    _ = &Node5; //discarding "local variable is never mutated"
    // debug_print("Node5: {any}\n", .{Node5});

    //Print linked list
    var while_loop_pointer: ?*Node = &head_Node;
    var position: u8 = 0;
    while (while_loop_pointer != null) {
        position += 1;
        debug_print("Element {d}: {d}\n", .{ position, while_loop_pointer.?.value });
        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }

    // debug_print("@TypeOf(Node1) {any}\n", .{@TypeOf(Node1)});
    // debug_print("@TypeOf(Node1.next_node_pointer) {any}\n", .{@TypeOf(Node1.next_node_pointer)});
    // debug_print("@TypeOf(Node1.value) {any}\n", .{@TypeOf(Node1.value)});

    //FIND NODE BY POSITION
    //ASK user which they want to find (keep track of LinkedList length & confine user input to
    //  existing values, and share message if error)
    //FIND 3rd node
    while_loop_pointer = &head_Node;
    position = 0;
    while (while_loop_pointer != null) {
        position += 1;
        if (position == 3) {
            break;
        }

        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }
    debug_print("Element {d}: {d}\n", .{ position, while_loop_pointer.?.value });

    //FIND NODE BY VALUE
    while_loop_pointer = &head_Node;
    var value: i8 = 87;
    position = 0;
    while (while_loop_pointer != null) {
        position += 1;
        if (while_loop_pointer.?.value == value) {
            break;
        }

        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }
    if (while_loop_pointer == null) {
        debug_print("Sorry, your value wasn't found\n", .{});
    } else {
        debug_print("Your value {d} was found at position {d}\n", .{ value, position });
    }

    //debug_print("Element {d}: {d}\n", .{ position, while_loop_pointer.?.value });

    //INSERT NODE BY POSITION
    //POSITION 4
    while_loop_pointer = &head_Node;
    position = 0;
    var goal_position: i8 = 4;
    while (while_loop_pointer != null) {
        position += 1;
        if (position == goal_position - 1) {
            break;
        }

        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }
    value = while_loop_pointer.?.value;
    debug_print("current position is {d} & current value is {d}\n", .{ position, value });
    var inserted_Node: Node = .{ .value = -4, .next_node_pointer = while_loop_pointer.?.next_node_pointer };
    while_loop_pointer.?.next_node_pointer = &inserted_Node;

    //Print linked list
    while_loop_pointer = &head_Node;
    position = 0;
    while (while_loop_pointer != null) {
        position += 1;
        debug_print("Element {d}: {d}\n", .{ position, while_loop_pointer.?.value });
        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }

    //DELETE NODE BY POSITION
    //POSITION 2
    while_loop_pointer = &head_Node;
    position = 0;
    goal_position = 2;
    while (while_loop_pointer != null) {
        position += 1;
        if (position == goal_position - 1) {
            break;
        }

        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }
    value = while_loop_pointer.?.value;
    debug_print("\ncurrent position is {d} & current value is {d}\n", .{ position, value });
    const deleted_Node: ?*Node = while_loop_pointer.?.next_node_pointer;
    debug_print("Node to deleted value is {d}\n", .{deleted_Node.?.value});
    while_loop_pointer.?.next_node_pointer = deleted_Node.?.next_node_pointer;

    //Print linked list
    while_loop_pointer = &head_Node;
    position = 0;
    while (while_loop_pointer != null) {
        position += 1;
        debug_print("Element {d}: {d}\t\t", .{ position, while_loop_pointer.?.value });
        debug_print("Address {d}: {*}\n", .{ position, while_loop_pointer });
        while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    }
    //SPECIAL CASE DELETE NODE BY POSITION: DELETING HEAD NODE
    //Can I use pointer arithemetic?

    //need to print out linkedlist addresses

    //ORDER NODES
    //using bubble sort for simplicity
    //Pseudo Code
    while_loop_pointer = &head_Node;
    debug_print("\nCurrent value is {d}\t\t", .{while_loop_pointer.?.value});
    debug_print("Next value is {d}\n", .{while_loop_pointer.?.next_node_pointer.?.value});

    var placeholder_Node: ?*Node = undefined;
    var subsequent_Node: ?*Node = undefined;
    //while (while_loop_pointer != null) {  //might need to use "while_loop_pointer.?.next_node_pointer" instead to avoid null, same thing happens in bubble sort file
    //if (while_loop_pointer.?.value > while_loop_pointer.?.next_node_pointer.?.value)

    while_loop_pointer = &head_Node;
    position = 0;
    subsequent_Node = while_loop_pointer.?.next_node_pointer;

    if (while_loop_pointer == &head_Node) { //ONLY for head node
        placeholder_Node = &head_Node;
        head_Node = subsequent_Node.?.*;
        while_loop_pointer.?.next_node_pointer = placeholder_Node;
    }

    while_loop_pointer = &head_Node;
    position = 0;
    debug_print("\nCurrent value is {d}\t\t", .{while_loop_pointer.?.value});
    debug_print("Current Address is {*}\n", .{while_loop_pointer});

    debug_print("Next value is {d}\t\t", .{while_loop_pointer.?.next_node_pointer.?.value});
    debug_print("Next Address is {*}\n", .{while_loop_pointer.?.next_node_pointer});
    //Print linked list
    // while_loop_pointer = &head_Node;
    // position = 0;
    // while (while_loop_pointer != null) {
    //     position += 1;
    //     debug_print("Element {d}: {d}\t\t", .{ position, while_loop_pointer.?.value });
    //     debug_print("Address {d}: {*}\n", .{ position, while_loop_pointer });
    //     while_loop_pointer = while_loop_pointer.?.next_node_pointer;
    // }

    //INSERT NODE BY VALUE
    //(If list is not in order, calls order nodes function first)
    //DELETE NODE BY VALUE
    //(If list is not in order, calls order nodes function first)
    //MANY SPECIAL/EDGE CASE: Deleting/inserting first or last nodes...
    //BELOW code might be useful when breaking everything into functions
    //{

    //debug_print("@typeInfo(Node1.next_node_pointer) {any}", .{@typeInfo(Node1.next_node_pointer)}); //"error: "Unable to evaluate comptime expression"
    //debug_print("@Type(Node1.next_node_pointer) {any}", .{@Type(Node1.next_node_pointer)}); //"error: expected type 'builtin.Type', found '?*Linked_List.Node'"
    //debug_print("@Type(Node1.value) {any}", .{@Type(Node1.value)}); //"error: expected type 'builtin.Type', found '?*Linked_List.Node'"

    //(in later versions) ask user 1st value
    //call createLinkedList using that value
    //const Node1 = createNode(87, null); //might be used when I break code into functions

    //debug_print("@Type(Node1) {any}", .{@Type(Node1)});
    //    try debug_print("value1: {d}", .{Node1.value});
    //try debug_print("next_node_pointer: {any}", .{Node1.next_node_pointer});

    // const Node2 = createNode(17, &Node1);
    // debug_print("Node2: {any}", .{Node2});
    //}
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
