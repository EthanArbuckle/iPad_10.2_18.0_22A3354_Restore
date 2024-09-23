@implementation OS_axr_data

- (void)dealloc
{
  objc_super v3;

  (*(void (**)(OS_axr_data *, SEL))self[2].super.super.isa)(self + 2, a2);
  v3.receiver = self;
  v3.super_class = (Class)OS_axr_data;
  -[OS_axr_data dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("axr_data_t <%p>"), self);
}

- (NSString)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AXRData *v9;
  Class isa;
  unint64_t v11;
  size_t v12;
  uint64_t ChannelCount;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t LayerCount;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  NSString *v29;
  objc_super v31;

  v9 = (AXRData *)&self[2];
  isa = self[12].super.super.isa;
  if (isa)
  {
    v11 = 0;
    v12 = (_QWORD)isa << 8;
    do
    {
      ChannelCount = AXRData::GetChannelCount(v9, v11, v2, v3, v4, v5, v6, v7);
      LayerCount = AXRData::GetLayerCount(v9, v11, v14, v15, v16, v17, v18, v19);
      v12 += (ChannelCount << 9)
           + (LayerCount << 8)
           + (AXRData::GetImagePropertyCount(v9, v11++, v21, v22, v23, v24, v25, v26) << 7);
    }
    while (isa != (Class)v11);
  }
  else
  {
    v12 = 0;
  }
  v27 = (char *)malloc_type_malloc(v12, 0x4C379A97uLL);
  if (!v27)
    return 0;
  v28 = v27;
  AXRData::DebugDescription(v9, v27);
  v31.receiver = self;
  v31.super_class = (Class)OS_axr_data;
  v29 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:\n%s\n"), -[OS_axr_data debugDescription](&v31, sel_debugDescription), v28);
  free(v28);
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  return self && a3 && AXRData::IsEqual((uint64_t)&self[2], (uint64_t)a3 + 16);
}

- (unint64_t)hash
{
  unint64_t result;

  AXRData::GetHash((AXRData *)&self[2]);
  return result;
}

@end
