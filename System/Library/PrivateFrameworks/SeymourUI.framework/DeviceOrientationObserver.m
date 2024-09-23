@implementation DeviceOrientationObserver

- (void)deviceDidRotateWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B8E770);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22BA79320();
    v7 = sub_22BA79344();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_22BA79344();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  swift_retain();
  sub_22B3BCDD4();
  swift_release();
  sub_22B3BCFC4((uint64_t)v6);
}

@end
