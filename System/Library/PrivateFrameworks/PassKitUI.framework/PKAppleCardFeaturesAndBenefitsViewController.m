@implementation PKAppleCardFeaturesAndBenefitsViewController

- (PKAppleCardFeaturesAndBenefitsViewController)init
{
  id v3;
  PKAppleCardFeaturesAndBenefitsViewController *v4;
  objc_class *v5;
  objc_super v7;

  v3 = objc_allocWithZone((Class)type metadata accessor for AppleCardFeaturesAndBenefitsManager());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsViewController_dataManager) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppleCardFeaturesAndBenefitsViewController();
  return -[PKAppleCardFeaturesAndBenefitsViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
}

- (PKAppleCardFeaturesAndBenefitsViewController)initWithCoder:(id)a3
{
  PKAppleCardFeaturesAndBenefitsViewController *result;

  result = (PKAppleCardFeaturesAndBenefitsViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  PKAppleCardFeaturesAndBenefitsViewController *v2;

  v2 = self;
  sub_19D70EFF8();

}

- (PKAppleCardFeaturesAndBenefitsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PKAppleCardFeaturesAndBenefitsViewController *result;

  v4 = a4;
  result = (PKAppleCardFeaturesAndBenefitsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsViewController_dataManager));
}

@end
