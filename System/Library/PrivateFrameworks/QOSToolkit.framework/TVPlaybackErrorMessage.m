@implementation TVPlaybackErrorMessage

- (id)logger
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->logger[8];
  v5[4] = *(_QWORD *)self->logger;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_244E96E64;
  v5[3] = &block_descriptor_27;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (id)metricsRecorder
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->metricsRecorder[8];
  v5[4] = *(_QWORD *)self->metricsRecorder;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_244E96F48;
  v5[3] = &block_descriptor_24;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (id)defaultAlert
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->defaultAlert[8];
  v5[4] = *(_QWORD *)self->defaultAlert;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_244E97028;
  v5[3] = &block_descriptor_0;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (id)getLocalizedErrorMessageForItems:(id)a3 :(id)a4
{
  uint64_t v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[184];
  _BYTE v13[184];

  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
  v6 = sub_244EA1188();
  v7 = *(void (**)(void))self->metricsRecorder;
  sub_244E98F74((uint64_t)v13);
  sub_244E8DFFC((uint64_t)v13, (uint64_t)v12, &qword_257426270);
  v8 = a4;
  swift_retain();
  sub_244E98F98(v6, (uint64_t)v12, (uint64_t)objc_msgSend(v8, sel_code), 1);
  v7();
  v9 = swift_bridgeObjectRelease();
  v10 = (void *)(*(uint64_t (**)(uint64_t))self->defaultAlert)(v9);

  swift_release();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)fetchLocalizedErrorMessageForItems:(NSDictionary *)a3 :(NSError *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSDictionary *v17;
  NSError *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v9 - 8) + 64), v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_244EA1338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2574262A0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2574262B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_244E98560((uint64_t)v11, (uint64_t)&unk_2574262C0, (uint64_t)v16);
  swift_release();
}

@end
