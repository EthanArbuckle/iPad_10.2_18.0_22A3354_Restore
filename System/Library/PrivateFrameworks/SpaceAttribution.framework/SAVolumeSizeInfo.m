@implementation SAVolumeSizeInfo

- (SAVolumeSizeInfo)init
{
  char *v2;
  SAVolumeSizeInfo *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAVolumeSizeInfo;
  v2 = -[SAVolumeSizeInfo init](&v6, sel_init);
  v3 = (SAVolumeSizeInfo *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t used;
  id v5;

  used = self->_used;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", used, CFSTR("usedSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purgeableSize, CFSTR("purgeableSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_rawUsed, CFSTR("rawUsedSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mountedOn, CFSTR("mountedOnPath"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_capacity, CFSTR("capacitySize"));

}

- (SAVolumeSizeInfo)initWithCoder:(id)a3
{
  id v4;
  SAVolumeSizeInfo *v5;
  uint64_t v6;
  NSString *mountedOn;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SAVolumeSizeInfo;
  v5 = -[SAVolumeSizeInfo init](&v9, sel_init);
  if (v5)
  {
    v5->_used = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("usedSize"));
    v5->_purgeableSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purgeableSize"));
    v5->_rawUsed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rawUsedSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mountedOnPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    mountedOn = v5->_mountedOn;
    v5->_mountedOn = (NSString *)v6;

    v5->_capacity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("capacitySize"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)used
{
  return self->_used;
}

- (void)setUsed:(unint64_t)a3
{
  self->_used = a3;
}

- (unint64_t)rawUsed
{
  return self->_rawUsed;
}

- (void)setRawUsed:(unint64_t)a3
{
  self->_rawUsed = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->_purgeableSize = a3;
}

- (NSString)mountedOn
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMountedOn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountedOn, 0);
}

@end
