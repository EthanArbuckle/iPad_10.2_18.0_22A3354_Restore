@implementation InternalMedicalIDViewController

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v5;
  _TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100033470(a3);

}

- (void)medicalIDViewControllerDidCancel:(void *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  if (a3)
  {
    v7 = a1;
    v4 = a3;
    v5 = objc_msgSend(v4, "navigationController");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

      v4 = v7;
      v7 = v6;
    }

  }
  else
  {
    __break(1u);
  }
}

- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InternalMedicalIDViewController();
  return -[InternalMedicalIDViewController initInEditMode:inBuddy:organDonationSignupAvailable:](&v9, "initInEditMode:inBuddy:organDonationSignupAvailable:", v7, v6, v5);
}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController)initWithCoder:(id)a3
{
  return (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController *)sub_10003369C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))type metadata accessor for InternalMedicalIDViewController);
}

@end
