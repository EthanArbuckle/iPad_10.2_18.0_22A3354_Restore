@implementation __VMULeaksMarkerObject

- (void)dealloc
{
  $C6AC5999CB38BBFF64BCC54667DCCE81 *region;
  unsigned int entryIndex;
  objc_super v5;
  _QWORD v6[5];
  unsigned int v7;

  region = self->_region;
  if (region)
  {
    entryIndex = self->_entryIndex;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___removeEntryFromMarkingRegion_block_invoke;
    v6[3] = &__block_descriptor_44_e5_v8__0l;
    v7 = entryIndex;
    v6[4] = region;
    _singleThreadedMarking(v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)__VMULeaksMarkerObject;
  -[__VMULeaksMarkerObject dealloc](&v5, sel_dealloc);
}

- ($C6AC5999CB38BBFF64BCC54667DCCE81)region
{
  return self->_region;
}

- (void)setRegion:(id *)a3
{
  self->_region = a3;
}

- (unsigned)entryIndex
{
  return self->_entryIndex;
}

- (void)setEntryIndex:(unsigned int)a3
{
  self->_entryIndex = a3;
}

@end
