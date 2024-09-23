@implementation PBCodable(VCPBCodable)

- (uint64_t)writeTo:()VCPBCodable error:
{
  objc_msgSend(a1, "writeTo:");
  if (a4)
    *a4 = 0;
  return 1;
}

- (uint64_t)readFrom:()VCPBCodable error:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a1, "readFrom:", v6);
  v8 = v7;
  if (a4 && (v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read protobuf message from %lu of %lu bytes"), objc_msgSend(v6, "position"), objc_msgSend(v6, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PBRequesterErrorDomain"), 6005, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
