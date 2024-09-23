@implementation SPKeyIndexMap

- (SPKeyIndexMap)init
{
  -[SPKeyIndexMap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  sp_key_index_map_destroy((uint64_t)self->_mapHandle);
  v3.receiver = self;
  v3.super_class = (Class)SPKeyIndexMap;
  -[SPKeyIndexMap dealloc](&v3, sel_dealloc);
}

- (SPKeyIndexMap)initWithBeaconIdentifier:(id)a3 keySequence:(unsigned __int8)a4 mapHandle:(id *)a5
{
  id v9;
  SPKeyIndexMap *v10;
  SPKeyIndexMap *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPKeyIndexMap;
  v10 = -[SPKeyIndexMap init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_beaconIdentifier, a3);
    v11->_sequence = a4;
    v11->_mapHandle = a5;
  }

  return v11;
}

- (id)headerString
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("version: %u, "), sp_key_index_map_get_version((uint64_t)self->_mapHandle));
  objc_msgSend(v3, "appendFormat:", CFSTR("first-index: %u, "), sp_key_index_map_get_first_index((uint64_t)self->_mapHandle));
  objc_msgSend(v3, "appendFormat:", CFSTR("last-index: %u, "), sp_key_index_map_get_last_index((uint64_t)self->_mapHandle));
  return v3;
}

- (NSUUID)beaconIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)sequence
{
  return self->_sequence;
}

- ($EC84D457EBFBFF33C77E50ECD9DADC88)mapHandle
{
  return self->_mapHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end
