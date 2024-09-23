@implementation PXObservableObservation

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v7;
  _TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation *v8;

  v7 = a3;
  v8 = self;
  sub_244335F1C((uint64_t)v7, a4);

}

- (_TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation)init
{
  sub_244335FEC();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_24432ED20(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler));
}

@end
