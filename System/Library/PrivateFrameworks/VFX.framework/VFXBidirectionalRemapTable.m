@implementation VFXBidirectionalRemapTable

- (int64_t)presentationEntityFromModel:(int64_t)a3
{
  VFXBidirectionalRemapTable *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1B1DBE2C8(a3);

  return v5;
}

- (void)add:(int64_t)a3 :(int64_t)a4
{
  VFXBidirectionalRemapTable *v6;

  v6 = self;
  sub_1B1DBE3BC(a3, a4);

}

- (VFXBidirectionalRemapTable)init
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  VFXBidirectionalRemapTable *v6;
  uint64_t v7;
  objc_super v9;

  v3 = OBJC_IVAR___VFXBidirectionalRemapTable_remapTable;
  type metadata accessor for BidirectionalRemapTable();
  v4 = (objc_class *)swift_allocObject();
  v5 = objc_allocWithZone(MEMORY[0x1E0CB3740]);
  v6 = self;
  *((_QWORD *)v4 + 2) = objc_msgSend(v5, sel_init);
  v7 = MEMORY[0x1E0DEE9D8];
  *((_QWORD *)v4 + 3) = sub_1B1B95EBC(MEMORY[0x1E0DEE9D8]);
  *((_QWORD *)v4 + 4) = sub_1B1B95EBC(v7);
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for VFXBidirectionalRemapTable();
  return -[VFXBidirectionalRemapTable init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
