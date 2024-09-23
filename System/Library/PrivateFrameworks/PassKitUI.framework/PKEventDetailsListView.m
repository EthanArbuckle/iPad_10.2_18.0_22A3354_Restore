@implementation PKEventDetailsListView

+ (id)createWithItems:(id)a3
{
  id v3;

  type metadata accessor for EventDetailsListViewItem(0);
  sub_19DE87E10();
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE4BAD88));
  return (id)sub_19DE85CA4();
}

- (PKEventDetailsListView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EventDetailsListHostView();
  return -[PKEventDetailsListView init](&v3, sel_init);
}

@end
