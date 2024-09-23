@implementation TSTChangeDescriptor

- (TSTChangeDescriptor)initWithChangeDescriptorType:(int)a3 andCellRegion:(id)a4 andCellID:(id)a5 andStrokeRegion:(id)a6 andReferenceIdentifiers:(id)a7
{
  TSTChangeDescriptor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSTChangeDescriptor;
  v12 = -[TSTChangeDescriptor init](&v14, sel_init);
  if (v12)
  {
    v12->mCellRegion = (TSTCellRegion *)a4;
    v12->mCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a5;
    v12->mChangeDescriptor = a3;
    v12->mStrokeRegion = (TSTCellRegion *)a6;
    v12->mExpandedRegion = (TSTCellRegion *)+[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion");
    v12->mReferenceIdentifiers = (NSHashTable *)objc_msgSend(a7, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTChangeDescriptor;
  -[TSTChangeDescriptor dealloc](&v3, sel_dealloc);
}

+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, a4, 0xFFFFFFLL, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4 strokeRegion:(id)a5
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, a4, 0xFFFFFFLL, a5, 0);
}

+ (id)changeDescriptorWithType:(int)a3 strokeRegion:(id)a4
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0xFFFFFFLL, a4, 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRegion:(id)a5 strokeRegion:(id)a6
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, a5, *(unsigned int *)&a4, a6, 0);
}

+ (id)changeDescriptorWithType:(int)a3
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0xFFFFFFLL, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5), *(unsigned int *)&a4, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5 strokeRange:(id)a6
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5), *(unsigned int *)&a4, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a6), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 strokeRange:(id)a5
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), *(unsigned int *)&a4, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), 0xFFFFFFLL, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0);
}

+ (id)changeDescriptorWithType:(int)a3 strokeRange:(id)a4
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0xFFFFFFLL, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), 0);
}

+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4 strokeRange:(id)a5
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), 0xFFFFFFLL, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5), 0);
}

+ (id)changeDescriptorWithType:(int)a3 referenceIdentifiers:(id)a4
{
  return -[TSTChangeDescriptor initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:]([TSTChangeDescriptor alloc], "initWithChangeDescriptorType:andCellRegion:andCellID:andStrokeRegion:andReferenceIdentifiers:", *(_QWORD *)&a3, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), 0xFFFFFFLL, +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion"), a4);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  int mChangeDescriptor;

  if (self == a3)
  {
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  if (!a3)
    goto LABEL_7;
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
    return (char)v4;
  v5 = v4;
  mChangeDescriptor = self->mChangeDescriptor;
  if (mChangeDescriptor != objc_msgSend(v4, "changeDescriptor"))
    goto LABEL_7;
  LODWORD(v4) = -[TSTCellRegion equalsCellRegion:](self->mCellRegion, "equalsCellRegion:", objc_msgSend(v5, "cellRegion"));
  if (!(_DWORD)v4)
    return (char)v4;
  if (((*(_DWORD *)&self->mCellID ^ objc_msgSend(v5, "cellID")) & 0xFFFFFF) == 0)
  {
    LODWORD(v4) = -[TSTCellRegion equalsCellRegion:](self->mStrokeRegion, "equalsCellRegion:", objc_msgSend(v5, "strokeRegion"));
    if ((_DWORD)v4)
      LOBYTE(v4) = -[TSTCellRegion equalsCellRegion:](self->mExpandedRegion, "equalsCellRegion:", objc_msgSend(v5, "expandedRegion"));
  }
  else
  {
LABEL_7:
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)strokeRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)-[TSTCellRegion boundingCellRange](self->mStrokeRegion, "boundingCellRange");
}

- (void)setExpandedRange:(id)a3
{

  self->mExpandedRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a3);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)expandedRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)-[TSTCellRegion boundingCellRange](self->mExpandedRegion, "boundingCellRange");
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)-[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t mChangeDescriptor;
  const __CFString *v7;
  void *v8;
  $CA3468F20078D5D2DB35E78E73CA60DA v9;
  void *v10;
  uint64_t v11;
  $CA3468F20078D5D2DB35E78E73CA60DA v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  mChangeDescriptor = self->mChangeDescriptor;
  if (mChangeDescriptor > 0x28)
    v7 = CFSTR("UNKNOWN");
  else
    v7 = off_24D82F3F0[mChangeDescriptor];
  v8 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@"), v5, self, v7);
  if (!-[TSTCellRegion isEmpty](self->mCellRegion, "isEmpty"))
  {
    v9 = -[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange");
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v9.var0.var1, v9.var0.var0);
    objc_msgSend(v8, "appendFormat:", CFSTR(" range:%@"), objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@, %@)"), v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), v9.var1.var0, HIWORD(*(unint64_t *)&v9))));
  }
  if (self->mCellID.row != 0xFFFF && (*(_DWORD *)&self->mCellID & 0xFF0000) != 0xFF0000)
    objc_msgSend(v8, "appendFormat:", CFSTR(" cell:%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(*(_DWORD *)&self->mCellID), (unsigned __int16)*(_DWORD *)&self->mCellID));
  if (!-[TSTCellRegion isEmpty](self->mStrokeRegion, "isEmpty"))
  {
    v12 = -[TSTCellRegion boundingCellRange](self->mStrokeRegion, "boundingCellRange");
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v12.var0.var1, v12.var0.var0);
    objc_msgSend(v8, "appendFormat:", CFSTR(" strokeRange:%@"), objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@, %@)"), v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), v12.var1.var0, HIWORD(*(unint64_t *)&v12))));
  }
  objc_msgSend(v8, "appendString:", CFSTR(" >"));
  return v8;
}

- (int)changeDescriptor
{
  return self->mChangeDescriptor;
}

- (TSTCellRegion)cellRegion
{
  return self->mCellRegion;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCellID;
}

- (TSTCellRegion)strokeRegion
{
  return self->mStrokeRegion;
}

- (TSTCellRegion)expandedRegion
{
  return self->mExpandedRegion;
}

- (void)setExpandedRegion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSHashTable)referenceIdentifiers
{
  return self->mReferenceIdentifiers;
}

@end
