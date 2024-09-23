@implementation KeyboardObserver

- (void)keyboardWillShowWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v12[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A8188);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_19DE833D0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = &v12[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_19DE833B8();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[15] = 1;
  swift_retain_n();
  sub_19DE85260();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_19D53BD48((uint64_t)v6);
  sub_19D1A9DC0((uint64_t)v6, &qword_1EE4A8188);
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A8188);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_19DE833D0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE833B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  sub_19DE82CB0();
  sub_19D53BD48((uint64_t)v6);
  sub_19D1A9DC0((uint64_t)v6, &qword_1EE4A8188);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)keyboardDidHideWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v8[16];

  v3 = sub_19DE833D0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_19DE833B8();
  swift_getKeyPath();
  swift_getKeyPath();
  v8[15] = 0;
  sub_19DE82CB0();
  sub_19DE85260();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A8188);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_19DE833D0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE833B8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_19DE82CB0();
  sub_19D53BD48((uint64_t)v6);
  sub_19D1A9DC0((uint64_t)v6, &qword_1EE4A8188);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end
