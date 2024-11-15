@implementation STStgInfo

- (STStgInfo)init
{
  STStgInfo *v2;
  NSString *v3;
  NSString *m_pstrName;
  STStgInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStgInfo;
  v2 = -[STStgInfo init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x24BDD17C8]);
    m_pstrName = v2->m_pstrName;
    v2->m_pstrName = v3;

    *(_QWORD *)&v2->m_type = 0;
    v2->m_size = 0;
    *(_OWORD *)&v2->m_creationTime = 0u;
    *(_OWORD *)&v2->m_accessMode = 0u;
    *(_DWORD *)&v2->m_clsid.m_data4[4] = 0;
    v5 = v2;
  }

  return v2;
}

- (STStgInfo)initWithStgInfo:(const _StgInfo *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  unint64_t var3;
  int64_t var4;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STStgInfo;
  v4 = -[STStgInfo init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", a3->var0, _ChWcslen(a3->var0));
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    *((_DWORD *)v4 + 4) = a3->var1 != 1;
    var3 = a3->var3;
    var4 = a3->var4;
    *((_DWORD *)v4 + 5) = a3->var2;
    *((_DWORD *)v4 + 6) = var3;
    *((_QWORD *)v4 + 4) = var4;
    *((_QWORD *)v4 + 5) = a3->var5;
    *((_DWORD *)v4 + 12) = STStgModeFromStgMode(a3->var6);
    *(_SSRW_GUID *)(v4 + 52) = a3->var7;
    v9 = v4;
  }

  return (STStgInfo *)v4;
}

- (id)getName
{
  return self->m_pstrName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->m_pstrName, a3);
}

- (int)getType
{
  return self->m_type;
}

- (void)setType:(int)a3
{
  self->m_type = a3;
}

- (unsigned)getUserFlags
{
  return self->m_userFlags;
}

- (void)setUserFlags:(unsigned int)a3
{
  self->m_userFlags = a3;
}

- (unsigned)getSize
{
  return self->m_size;
}

- (void)setSize:(unsigned int)a3
{
  self->m_size = a3;
}

- (int64_t)getCreationTime
{
  return self->m_creationTime;
}

- (void)setCreationTime:(int64_t)a3
{
  self->m_creationTime = a3;
}

- (int64_t)getModificationTime
{
  return self->m_modificationTime;
}

- (void)setModificationTime:(int64_t)a3
{
  self->m_modificationTime = a3;
}

- (int)getAccessMode
{
  return self->m_accessMode;
}

- (void)setAccessMode:(int)a3
{
  self->m_accessMode = a3;
}

- ($DF246ECBFA7C13B1931CDA33BA2B4196)getCLSID
{
  uint64_t v2;
  uint64_t v3;
  $DF246ECBFA7C13B1931CDA33BA2B4196 result;

  v2 = *(_QWORD *)self->m_clsid.m_data4;
  v3 = *(_QWORD *)&self->m_clsid.m_data1;
  *(_QWORD *)result.var3 = v2;
  result.var0 = v3;
  result.var1 = WORD2(v3);
  result.var2 = HIWORD(v3);
  return result;
}

- (void)setCLSID:(id)a3
{
  self->m_clsid = ($A1D20F76D461EED75A470F86FF761910)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_pstrName, 0);
}

@end
