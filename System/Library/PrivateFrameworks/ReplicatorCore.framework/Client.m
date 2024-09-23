@implementation Client

- (NSString)description
{
  os_unfair_lock_s *v2;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v3;
  void *v4;
  uint64_t v6;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client_lock)
                          + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_2451EB74C(&v6);
  os_unfair_lock_unlock(v2);

  v4 = (void *)sub_245244A44();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client)init
{
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *result;

  result = (_TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_connection));
  swift_release();
  sub_2451EB788((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  swift_bridgeObjectRelease();
}

- (id)isClientEnabledWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_24524475C();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE806D8];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_245244618();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0((unint64_t *)&unk_25744DF08, v6, MEMORY[0x24BE806D0]);
  sub_24524454C();
  v14 = self;
  sub_2451DF548();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0((unint64_t *)&unk_25744DEB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE80568], MEMORY[0x24BE80560]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (id)enableClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_245244714();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80670];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_245244618();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_25744DF00, v6, MEMORY[0x24BE80668]);
  sub_24524454C();
  v14 = self;
  sub_2451DFAB0(MEMORY[0x24BE80660], (uint64_t (*)(void))sub_2451EB6E4, (_QWORD *(*)(uint64_t *__return_ptr))sub_2451EBBCC, (uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0((unint64_t *)&unk_25744DEB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE80568], MEMORY[0x24BE80560]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (id)disableClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_245244720();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80688];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_245244618();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_25744DEA8, v6, MEMORY[0x24BE80680]);
  sub_24524454C();
  v14 = self;
  sub_2451DFAB0(MEMORY[0x24BE80678], (uint64_t (*)(void))sub_2451EB63C, (_QWORD *(*)(uint64_t *__return_ptr))sub_2451EB620, (uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0((unint64_t *)&unk_25744DEB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE80568], MEMORY[0x24BE80560]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (BOOL)registerClientWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE806C0], (unint64_t *)&unk_2544097E8, MEMORY[0x24BE806B8], (void (*)(char *))sub_2451DFEB0);
}

- (BOOL)unregisterClientWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE806F0], &qword_25744DEA0, MEMORY[0x24BE806E8], (void (*)(char *))sub_2451E01BC);
}

- (id)clientDescriptorWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_24524478C();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80720];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_245244648();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_254409DE0, v6, MEMORY[0x24BE80718]);
  sub_24524454C();
  v14 = self;
  sub_2451E0634((uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0(&qword_254409DD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE805B0], MEMORY[0x24BE805A8]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (id)localDeviceIDAndReturnError:(id *)a3
{
  return sub_2451E1D38(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE80580], (void (*)(void))sub_2451E0CC8, &qword_254409E08, MEMORY[0x24BE80578]);
}

- (BOOL)addRecordsWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v6;

  v5 = a3;
  v6 = self;
  sub_2451E0EC8((uint64_t)v5);

  return 1;
}

- (BOOL)removeRecordsWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE806A8], (unint64_t *)&unk_254409E10, MEMORY[0x24BE806A0], (void (*)(char *))sub_2451E126C);
}

- (id)recordsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v10;
  void *v11;
  uint64_t v13;

  v5 = sub_2452446CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2451E89D0(&qword_254409E58, v9, MEMORY[0x24BE80608]);
  sub_24524454C();
  v10 = self;
  v11 = (void *)sub_2451E1498((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)recordVersionsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_245244774();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80708];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_245244630();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_2544097F8, v6, MEMORY[0x24BE80700]);
  sub_24524454C();
  v14 = self;
  sub_2451E2CB0(MEMORY[0x24BE806F8], (void (*)(uint64_t *__return_ptr))sub_2451EB250, MEMORY[0x24BE80588], (uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0(&qword_2544097D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE80598], MEMORY[0x24BE80590]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (BOOL)syncAndReturnError:(id *)a3
{
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v3;

  v3 = self;
  sub_2451E19C8();

  return 1;
}

- (id)devicesAndReturnError:(id *)a3
{
  return sub_2451E1D38(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE7FD40], sub_24520B2BC, (unint64_t *)&unk_254409718, MEMORY[0x24BE7FD38]);
}

- (BOOL)sendMessageWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))MEMORY[0x24BE80650], &qword_25744DE28, MEMORY[0x24BE80648], (void (*)(char *))sub_2451E1E54);
}

- (void)sendMessageExpectingResponseWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v12;
  uint64_t v13;

  v6 = sub_245244708();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80650];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_2451E89D0(&qword_25744DE28, v7, MEMORY[0x24BE80648]);
  sub_24524454C();
  _Block_copy(v11);
  v12 = self;
  sub_2451E9E10((uint64_t)v10, (uint64_t)v12, (void (**)(const void *, void *, void *))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
}

- (id)messagesWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_2452446D8();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE80628];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_2452445E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0((unint64_t *)&unk_2544097D8, v6, MEMORY[0x24BE80620]);
  sub_24524454C();
  v14 = self;
  sub_2451E2CB0(MEMORY[0x24BE80618], (void (*)(uint64_t *__return_ptr))sub_2451E9DF4, MEMORY[0x24BE80520], (uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0((unint64_t *)&unk_2544097C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE80530], MEMORY[0x24BE80528]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (_TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client)init
{
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *result;

  result = (_TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)pushTokenWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v14;
  void *v15;
  _BYTE v17[16];

  v5 = sub_245244114();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7FDE8];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_2452440CC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_25744E2C8, v6, MEMORY[0x24BE7FDE0]);
  sub_24524454C();
  v14 = self;
  sub_24520B430((uint64_t)v13);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v5);

  sub_2451E89D0((unint64_t *)&unk_25744E2D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE7FD88], MEMORY[0x24BE7FD80]);
  v15 = (void *)sub_245244558();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (void)pairWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v12;
  uint64_t v13;

  v6 = sub_245244144();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7FE18];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_2451E89D0(&qword_25744E2C0, v7, MEMORY[0x24BE7FE10]);
  sub_24524454C();
  _Block_copy(v11);
  v12 = self;
  sub_24520F190((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
}

- (BOOL)unpairWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE7FE30], (unint64_t *)&unk_25744E2A0, MEMORY[0x24BE7FE28], (void (*)(char *))sub_24520B92C);
}

- (BOOL)retryStuckRelationshipsAndReturnError:(id *)a3
{
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v3;

  v3 = self;
  sub_24520BA80();

  return 1;
}

- (id)isEnabledAndReturnError:(id *)a3
{
  return sub_2451E1D38(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE7FD58], (void (*)(void))sub_24520BC10, &qword_254409728, MEMORY[0x24BE7FD50]);
}

- (BOOL)setEnabledWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v17;
  void *v18;
  id v19;
  uint64_t v21;

  v6 = sub_2452440F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2451E89D0(&qword_254409730, v10, MEMORY[0x24BE7FDB0]);
  sub_24524454C();
  v11 = MEMORY[0x249531710]((char *)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  if (v11)
  {
    v12 = self;
    v13 = sub_2452440E4();
    sub_24520AA88(v13 & 1);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  }
  else
  {
    v14 = sub_2452438B0();
    sub_2451E89D0(&qword_25744E260, (uint64_t (*)(uint64_t))MEMORY[0x24BE7F490], MEMORY[0x24BE7F498]);
    v15 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BE7F470], v14);
    v17 = self;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    if (a4)
    {
      v18 = (void *)sub_2452436E8();

      v19 = v18;
      *a4 = v18;
    }
    else
    {

    }
  }
  return v11 != 0;
}

- (BOOL)enableAllowListWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *v17;
  void *v18;
  id v19;
  _BYTE v21[32];

  v6 = sub_24524412C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2451E89D0(&qword_25744E298, v10, MEMORY[0x24BE7FDF8]);
  sub_24524454C();
  v11 = MEMORY[0x249531710]((char *)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  if (v11)
  {
    v12 = self;
    sub_245244120();
    v13 = v11 + OBJC_IVAR____TtC14ReplicatorCore23ReplicatorControlServer_replicator;
    swift_beginAccess();
    __swift_mutable_project_boxed_opaque_existential_1(v13, *(_QWORD *)(v13 + 24));
    sub_245243A00();
    swift_endAccess();
    swift_unknownObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);

  }
  else
  {
    v14 = sub_2452438B0();
    sub_2451E89D0(&qword_25744E260, (uint64_t (*)(uint64_t))MEMORY[0x24BE7F490], MEMORY[0x24BE7F498]);
    v15 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BE7F470], v14);
    v17 = self;
    swift_willThrow();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);

    if (a4)
    {
      v18 = (void *)sub_2452436E8();

      v19 = v18;
      *a4 = v18;
    }
    else
    {

    }
  }
  return v11 != 0;
}

- (BOOL)setAllowListWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE7FE48], &qword_25744E290, MEMORY[0x24BE7FE40], (void (*)(char *))sub_24520C128);
}

- (BOOL)addIDToAllowListWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE7FDD0], (unint64_t *)&unk_25744E270, MEMORY[0x24BE7FDC8], (void (*)(char *))sub_24520C284);
}

- (BOOL)removeFromAllowListWithParameters:(id)a3 error:(id *)a4
{
  return sub_2451E2234(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BE7FDD0], (unint64_t *)&unk_25744E270, MEMORY[0x24BE7FDC8], (void (*)(char *))sub_24520C4F4);
}

- (id)isAllowListEnabledAndReturnError:(id *)a3
{
  return sub_2451E1D38(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE7FDA0], (void (*)(void))sub_24520C740, &qword_25744E268, MEMORY[0x24BE7FD98]);
}

- (id)allowListAndReturnError:(id *)a3
{
  return sub_2451E1D38(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE7FD70], (void (*)(void))sub_24520C88C, &qword_25744E258, MEMORY[0x24BE7FD68]);
}

@end
