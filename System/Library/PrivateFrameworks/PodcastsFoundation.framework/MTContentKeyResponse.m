@implementation MTContentKeyResponse

- (MTContentKeyRequest)request
{
  return (MTContentKeyRequest *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___MTContentKeyResponse_request));
}

- (NSDate)renewalDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A90A1CA8((uint64_t)self + OBJC_IVAR___MTContentKeyResponse_renewalDate, (uint64_t)v5);
  v6 = sub_1A93F738C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1A93F7314();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (NSError)error
{
  void **v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_error);
  swift_beginAccess();
  v3 = *v2;
  if (!v3)
    return (NSError *)0;
  v4 = v3;
  v5 = (void *)sub_1A93F711C();

  return (NSError *)v5;
}

- (void)setError:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_error);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSData)keyData
{
  return (NSData *)sub_1A9278268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MTContentKeyResponse_keyData);
}

- (void)setKeyData:(id)a3
{
  sub_1A927835C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MTContentKeyResponse_keyData);
}

- (MTContentKeyResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTContentKeyResponse *v9;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    v8 = (void *)sub_1A93F711C();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[MTContentKeyResponse initWithRequest:keyData:renewalDate:error:](self, sel_initWithRequest_keyData_renewalDate_error_, v6, 0, 0, v8);

  return v9;
}

- (MTContentKeyResponse)initWithRequest:(id)a3 keyData:(id)a4 renewalDate:(id)a5 error:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  MTContentKeyResponse *v24;
  uint64_t v26;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    v20 = a3;
    v21 = a5;
    v22 = a6;
    v18 = 0xF000000000000000;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v23 = sub_1A93F738C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    goto LABEL_6;
  }
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a4;
  a4 = (id)sub_1A93F72B4();
  v18 = v17;

  if (!a5)
    goto LABEL_5;
LABEL_3:
  sub_1A93F7368();

  v19 = sub_1A93F738C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 0, 1, v19);
LABEL_6:
  v24 = (MTContentKeyResponse *)sub_1A92788F8(a3, (uint64_t)a4, v18, (uint64_t)v12, a6);

  sub_1A9069F9C((uint64_t)a4, v18);
  return v24;
}

- (MTContentKeyResponse)init
{
  MTContentKeyResponse *result;

  result = (MTContentKeyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1A90AC3A4((uint64_t)self + OBJC_IVAR___MTContentKeyResponse_renewalDate);
  sub_1A9069F9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_keyData), *(_QWORD *)&self->request[OBJC_IVAR___MTContentKeyResponse_keyData]);
}

@end
