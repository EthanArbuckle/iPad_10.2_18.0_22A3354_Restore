@implementation ChargingNetworkPickerViewController

- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate
{
  return (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_delegate, a3);
}

+ (NSString)reuseIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;

  v5 = a3;
  if (a3)
  {
    v6 = sub_10000E4BC(0, (unint64_t *)&unk_1014994F0, VGChargingNetwork_ptr);
    v7 = sub_1000C6480();
    v5 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v5, v6, v7);
  }
  swift_unknownObjectRetain(a4);
  return (_TtC4Maps35ChargingNetworkPickerViewController *)sub_1001F9CDC(v5, (uint64_t)a4);
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001FAAE8(0xD000000000000023, 0x8000000100E53690, 42);
}

- (_TtC4Maps35ChargingNetworkPickerViewController)init
{
  sub_1001F9EF0();
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_1001FAAE8(0xD00000000000003CLL, 0x8000000100E53630, 52);
}

- (void)viewDidLoad
{
  _TtC4Maps35ChargingNetworkPickerViewController *v2;

  v2 = self;
  sub_1001FA024();

}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_tableView));
}

- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  id v6;
  _TtC4Maps35ChargingNetworkPickerViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1001FA6D8(v6, a4);

}

- (void)reloadData
{
  _TtC4Maps35ChargingNetworkPickerViewController *v2;

  v2 = self;
  if (-[ChargingNetworkPickerViewController isViewLoaded](v2, "isViewLoaded"))
    objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_tableView), "reloadData");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtC4Maps35ChargingNetworkPickerViewController *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "resignFirstResponder");
  -[ChargingNetworkPickerViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
