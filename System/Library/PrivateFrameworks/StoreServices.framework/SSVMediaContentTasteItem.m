@implementation SSVMediaContentTasteItem

- (SSVMediaContentTasteItem)initWithCoder:(id)a3
{
  id v4;
  SSVMediaContentTasteItem *v5;
  uint64_t v6;
  NSString *playlistGlobalID;

  v4 = a3;
  v5 = -[SSVMediaContentTasteItem init](self, "init");
  if (v5)
  {
    v5->_contentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SSVMediaContentTasteItemContentType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSVMediaContentTasteItemPlaylistGlobalID"));
    v6 = objc_claimAutoreleasedReturnValue();
    playlistGlobalID = v5->_playlistGlobalID;
    v5->_playlistGlobalID = (NSString *)v6;

    v5->_storeAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVMediaContentTasteItemStoreAdamID"));
    v5->_tasteType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SSVMediaContentTasteItemTasteType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t contentType;
  id v5;

  contentType = self->_contentType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", contentType, CFSTR("SSVMediaContentTasteItemContentType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playlistGlobalID, CFSTR("SSVMediaContentTasteItemPlaylistGlobalID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_storeAdamID, CFSTR("SSVMediaContentTasteItemStoreAdamID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tasteType, CFSTR("SSVMediaContentTasteItemTasteType"));

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t contentType;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  contentType = self->_contentType;
  if (contentType > 4)
    v8 = 0;
  else
    v8 = off_1E47BD8A8[contentType];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p contentType:%@"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString length](self->_playlistGlobalID, "length"))
    objc_msgSend(v9, "appendFormat:", CFSTR(" playlistGlobalID:'%@'"), self->_playlistGlobalID);
  else
    objc_msgSend(v9, "appendFormat:", CFSTR(" storeAdamID:%lli"), self->_storeAdamID);
  objc_msgSend(v9, "appendFormat:", CFSTR(" tasteType:%td>"), self->_tasteType);
  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SSVMediaContentTasteItem _copyWithMediaContentTasteItemClass:](self, "_copyWithMediaContentTasteItemClass:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteItem)initWithXPCEncoding:(id)a3
{
  id v4;
  uint64_t v5;
  id NSSecureCodingObjectForXPCObject;
  SSVMediaContentTasteItem *v7;

  v4 = a3;
  v5 = objc_opt_class();
  NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  v7 = (SSVMediaContentTasteItem *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (id)_copyWithMediaContentTasteItemClass:(Class)a3
{
  id v4;
  _QWORD *v5;

  v4 = objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = self->_contentType;
    objc_storeStrong((id *)v4 + 2, self->_playlistGlobalID);
    v5[3] = self->_storeAdamID;
    v5[4] = self->_tasteType;
  }
  return v5;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (unint64_t)tasteType
{
  return self->_tasteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

@end
