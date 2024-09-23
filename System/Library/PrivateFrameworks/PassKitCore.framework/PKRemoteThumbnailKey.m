@implementation PKRemoteThumbnailKey

- (id)copyWithZone:(_NSZone *)a3
{
  PKRemoteThumbnailKey *v5;
  uint64_t v6;
  NSDictionary *requestDictionary;
  uint64_t v8;
  NSString *requestIdentifier;

  v5 = -[PKRemoteThumbnailKey init](+[PKRemoteThumbnailKey allocWithZone:](PKRemoteThumbnailKey, "allocWithZone:"), "init");
  v6 = -[NSDictionary copyWithZone:](self->_requestDictionary, "copyWithZone:", a3);
  requestDictionary = v5->_requestDictionary;
  v5->_requestDictionary = (NSDictionary *)v6;

  v8 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  requestIdentifier = v5->_requestIdentifier;
  v5->_requestIdentifier = (NSString *)v8;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_requestIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_requestDictionary);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKRemoteThumbnailKey *v4;
  PKRemoteThumbnailKey *v5;
  BOOL v6;

  v4 = (PKRemoteThumbnailKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemoteThumbnailKey isEqualToRemoteThumbnailKey:](self, "isEqualToRemoteThumbnailKey:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteThumbnailKey:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  NSString *v6;
  BOOL v7;
  char v8;
  NSDictionary *requestDictionary;
  NSDictionary *v10;

  v4 = a3;
  requestIdentifier = self->_requestIdentifier;
  v6 = (NSString *)v4[1];
  if (requestIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSString isEqual:](requestIdentifier, "isEqual:") & 1) != 0)
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (requestIdentifier != v6)
    goto LABEL_7;
LABEL_9:
  requestDictionary = self->_requestDictionary;
  v10 = (NSDictionary *)v4[2];
  if (requestDictionary && v10)
    v8 = -[NSDictionary isEqual:](requestDictionary, "isEqual:");
  else
    v8 = requestDictionary == v10;
LABEL_13:

  return v8;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSDictionary)requestDictionary
{
  return self->_requestDictionary;
}

- (void)setRequestDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_requestDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
