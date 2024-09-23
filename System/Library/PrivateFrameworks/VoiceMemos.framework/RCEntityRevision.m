@implementation RCEntityRevision

- (int64_t)revisionType
{
  void *v3;
  int64_t v4;

  -[RCEntityRevision willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("revision_type"));
  -[RCEntityRevision primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("revision_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  -[RCEntityRevision didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("revision_type"));
  return v4;
}

- (void)setRevisionType:(int64_t)a3
{
  void *v5;

  -[RCEntityRevision willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("revision_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEntityRevision setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("revision_type"));

  -[RCEntityRevision didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("revision_type"));
}

- (int64_t)revisionID
{
  void *v3;
  int64_t v4;

  -[RCEntityRevision willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("revision_id"));
  -[RCEntityRevision primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("revision_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RCEntityRevision didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("revision_id"));
  return v4;
}

- (void)setRevisionID:(int64_t)a3
{
  void *v5;

  -[RCEntityRevision willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("revision_id"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEntityRevision setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("revision_id"));

  -[RCEntityRevision didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("revision_id"));
}

- (int64_t)recordingID
{
  void *v3;
  int64_t v4;

  -[RCEntityRevision willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("recording_id"));
  -[RCEntityRevision primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("recording_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RCEntityRevision didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("recording_id"));
  return v4;
}

- (void)setRecordingID:(int64_t)a3
{
  void *v5;

  -[RCEntityRevision willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("recording_id"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEntityRevision setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("recording_id"));

  -[RCEntityRevision didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("recording_id"));
}

@end
