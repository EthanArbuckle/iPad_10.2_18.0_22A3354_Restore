@implementation PLURIWithHash

- (PLURIWithHash)init
{
  return -[PLURIWithHash initWithXPCURI:](self, "initWithXPCURI:", 0);
}

- (PLURIWithHash)initWithXPCURI:(id)a3
{
  id v5;
  PLURIWithHash *v6;
  PLURIWithHash *v7;
  id v8;
  size_t length;
  size_t v10;
  size_t v11;
  char *bytes_ptr;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char v17;
  unint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLURIWithHash;
  v6 = -[PLURIWithHash init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uri, a3);
    v8 = v5;
    length = xpc_data_get_length(v8);
    if (length > 8)
    {
      v11 = length;
      bytes_ptr = (char *)xpc_data_get_bytes_ptr(v8);
      v13 = 0;
      LODWORD(v14) = 0;
      LODWORD(v15) = 0;
      v16 = &bytes_ptr[v11 - 1];
      do
      {
        v17 = *v16--;
        v15 = ((unint64_t)(v17 & 0x7F) << v13) | v15 | ((unint64_t)v14 << 32);
        v14 = HIDWORD(v15);
        v13 += 7;
      }
      while (v13 != 63);
      HIDWORD(v18) = HIDWORD(v15);
      LODWORD(v18) = HIDWORD(v15);
      HIDWORD(v18) = HIDWORD(v15) - (v18 >> 18);
      v19 = HIDWORD(v18);
      LODWORD(v18) = HIDWORD(v18);
      v20 = (HIDWORD(v18) ^ v15) - (v18 >> 21);
      HIDWORD(v18) = v20;
      LODWORD(v18) = v20;
      v21 = (v20 ^ v14) - (v18 >> 7);
      HIDWORD(v18) = v21;
      LODWORD(v18) = v21;
      v22 = (v21 ^ v19) - (v18 >> 16);
      HIDWORD(v18) = v22;
      LODWORD(v18) = v22;
      HIDWORD(v18) = (v22 ^ v20) - (v18 >> 28);
      LODWORD(v18) = HIDWORD(v18);
      HIDWORD(v18) = (HIDWORD(v18) ^ v21) - (v18 >> 18);
      LODWORD(v18) = HIDWORD(v18);
      v10 = (HIDWORD(v18) ^ v22) - (v18 >> 8);
    }
    else
    {
      v10 = xpc_hash(v8);
    }

    v7->_uriHash = v10;
  }

  return v7;
}

- (OS_xpc_object)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (unint64_t)uriHash
{
  return self->_uriHash;
}

- (void)setUriHash:(unint64_t)a3
{
  self->_uriHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
