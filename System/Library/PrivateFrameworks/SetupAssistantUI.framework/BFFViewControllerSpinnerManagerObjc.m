@implementation BFFViewControllerSpinnerManagerObjc

+ (void)configureWithNavigationController:(id)a3
{
  id v3;

  v3 = a3;
  _s16SetupAssistantUI28ViewControllerSpinnerManagerC023configureWithNavigationE0yySo013BFFNavigationE0CFZ_0(v3);

}

+ (void)startAnimatingSpinnerFor:(id)a3 identifier:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v5 = sub_214894AF8();
  v7 = v6;
  v8 = a3;
  _s16SetupAssistantUI28ViewControllerSpinnerManagerC014startAnimatingF03for10identifierySo06UIViewE0C_SStFZ_0(v8, v5, v7);

  swift_bridgeObjectRelease();
}

+ (void)stopAnimatingSpinnerFor:(id)a3
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)sub_214894AF8();
  v5 = v4;
  if (qword_254D929E0 != -1)
    swift_once();
  sub_21489242C(v3, v5);
  swift_bridgeObjectRelease();
}

- (void)startAnimatingSpinnerFor:(id)a3 identifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  BFFViewControllerSpinnerManagerObjc *v10;

  v6 = sub_214894AF8();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_214891754(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)stopAnimatingSpinnerFor:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  BFFViewControllerSpinnerManagerObjc *v7;

  v4 = (void *)sub_214894AF8();
  v6 = v5;
  v7 = self;
  sub_21489242C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  BFFViewControllerSpinnerManagerObjc *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_2148940C0(v9, a5);

}

- (BFFViewControllerSpinnerManagerObjc)init
{
  return (BFFViewControllerSpinnerManagerObjc *)ViewControllerSpinnerManager.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
