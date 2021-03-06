generic
   -- define these when instantiating
   type Vertex_Type is private;
   with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
   Zero : Vertex_Type;
   Max_Size : Natural := 100;
package Graph is
   Edge_Not_Found_Exception: exception;
   Vertex_Already_In_Graph_Exception: exception;
   Vertex_Is_Zero_Exception: exception;
   
   type Vertex_Array is array(Natural range <>) of Vertex_Type;

   procedure Add_Vertex(Vertex: Vertex_Type);
   -- Stores the Vertex in the Graph. Raises a 
   -- Vertex_Already_In_Graph_Exception if it is already in the graph.
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer);
   -- Stores a new edge in the Graph from From to To that has the given
   -- Weight assigned to it. If an edge from From to To is already stored
   -- in the Graph, this function only re-assigns the given Weight to it
   -- and does nothing beyond.
   procedure Clear;
   -- Removes all vertices and edges from the graph.
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer;
   -- Returns the weight of the edge, if it is stored in the graph.
   -- Raises an Edge_Not_Found_Exception otherwise.
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
   -- Returns True if an edge from From to To is stored in the graph.
   -- Returns False otherwise.
   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
   -- Removes the edge in the Graph from From to To, if existing; 
   -- Raises an Edge_Not_Found_Exception otherwise.
   function To_Vertex_Array return Vertex_Array;
   -- Returns an array containing exactly all current vertices of the graph.
private
   -- stuff we only need in package body
   type Edge_Type is record
      Weight : Integer := 0;
      From_Vertex : Vertex_Type;
      To_Vertex : Vertex_Type;
   end record;
   type Edge_Array is array(Natural range <>) of Edge_Type;
end Graph;
