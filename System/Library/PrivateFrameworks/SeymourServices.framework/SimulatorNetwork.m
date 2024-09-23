@implementation SimulatorNetwork

- (id)fetch:(id)a3
{
  id v5;
  _TtC15SeymourServices16SimulatorNetwork *v6;
  void *v7;
  void *v8;

  sub_1CEAE96C4(0, &qword_1EFB67E18);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1CF1523D4();
  v8 = (void *)sub_1CF1523E0();

  return v8;
}

- (_TtC15SeymourServices16SimulatorNetwork)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SimulatorNetwork();
  return -[SimulatorNetwork init](&v3, sel_init);
}

@end
