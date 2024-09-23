@implementation ShieldViewController

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC13UniversalDrag20ShieldViewController *v7;

  sub_249860BD4(0, &qword_2578918F0);
  sub_24986081C(&qword_2578918F8, &qword_2578918F0);
  sub_2498ACCDC();
  v6 = a4;
  v7 = self;
  sub_24985ED28();

  swift_bridgeObjectRelease();
}

- (_TtC13UniversalDrag20ShieldViewController)initWithCoder:(id)a3
{
  sub_24985F0CC();
}

- (void)viewDidLoad
{
  _TtC13UniversalDrag20ShieldViewController *v2;

  v2 = self;
  sub_24985F128();

}

- (_TtC13UniversalDrag20ShieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_2498ACBD4();
  v5 = a4;
  sub_24985F25C();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
