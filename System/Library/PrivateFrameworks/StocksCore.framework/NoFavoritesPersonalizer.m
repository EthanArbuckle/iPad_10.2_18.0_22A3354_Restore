@implementation NoFavoritesPersonalizer

- (FCPersonalizationWhitelist)whitelist
{
  return (FCPersonalizationWhitelist *)0;
}

- (void)prepareFavorites:(id)a3
{
  _QWORD *v3;
  void (*v4)(_QWORD *);

  v3 = _Block_copy(a3);
  v4 = (void (*)(_QWORD *))v3[2];
  sub_1ABF2FF68();
  v4(v3);
  _Block_release(v3);
  swift_release();
}

- (unint64_t)whitelistLevelForTagID:(id)a3
{
  return 2;
}

@end
