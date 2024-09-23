@implementation RDDispatchQueue_ObjC

+ (OS_dispatch_queue)utilityQueue
{
  return (OS_dispatch_queue *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100836F28, (id *)&qword_100871CE8, (uint64_t)sub_1001BA8F8);
}

+ (OS_dispatch_queue)xpcDefaultQueue
{
  return (OS_dispatch_queue *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100836F10, (id *)&qword_100871CD0, (uint64_t)sub_1001BA718);
}

- (_TtC7remindd20RDDispatchQueue_ObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDDispatchQueue_ObjC();
  return -[RDDispatchQueue_ObjC init](&v3, "init");
}

@end
