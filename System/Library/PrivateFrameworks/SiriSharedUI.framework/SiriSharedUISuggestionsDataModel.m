@implementation SiriSharedUISuggestionsDataModel

- (void)keyBoardWillShowWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[16];

  v3 = sub_1DE12FE04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DE12FDF8();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[15] = 1;
  swift_retain();
  sub_1DE13020C();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)keyBoardWillHideWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[16];

  v3 = sub_1DE12FE04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DE12FDF8();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[15] = 0;
  swift_retain();
  sub_1DE13020C();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

@end
