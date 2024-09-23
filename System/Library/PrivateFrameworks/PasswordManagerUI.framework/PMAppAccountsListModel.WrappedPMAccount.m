@implementation PMAppAccountsListModel.WrappedPMAccount

- (NSString)effectiveTitleForSorting
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setEffectiveTitleForSorting:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_243850264();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount_effectiveTitleForSorting);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount)init
{
  _TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount *result;

  result = (_TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_243537FB4((uint64_t)self + OBJC_IVAR____TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount_pmAccount, type metadata accessor for PMAccount);
}

@end
