@implementation InternalProfileCharacteristicsViewController

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InternalProfileCharacteristicsViewController();
  v6 = v9.receiver;
  -[InternalProfileCharacteristicsViewController setEditing:animated:](&v9, "setEditing:animated:", v5, v4);
  if (!v5)
  {
    v7 = objc_msgSend(v6, "navigationController", v9.receiver, v9.super_class);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

      v6 = v8;
    }
  }

}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithHealthStore:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalProfileCharacteristicsViewController();
  return -[InternalProfileCharacteristicsViewController initWithHealthStore:](&v5, "initWithHealthStore:", a3);
}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithCoder:(id)a3
{
  return (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController *)sub_10003369C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))type metadata accessor for InternalProfileCharacteristicsViewController);
}

@end
