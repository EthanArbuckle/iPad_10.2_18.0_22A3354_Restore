@implementation B2PBudVersionGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 0x1A)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    self->_activeMajor = *(_WORD *)v6;
    self->_activeMinor = *(_QWORD *)(v6 + 2);
    self->_activeRevision = *(_WORD *)(v6 + 10);
    self->_pendingMajor = *(_WORD *)(v6 + 12);
    self->_pendingMinor = *(_QWORD *)(v6 + 14);
    self->_pendingRevision = *(_WORD *)(v6 + 22);
    self->_activeFile = *(_BYTE *)(v6 + 24);
    self->_pendingFile = *(_BYTE *)(v6 + 25);
  }

  return v5 > 0x19;
}

- (NSString)activeVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u.%llu.%u"), self->_activeMajor, self->_activeMinor, self->_activeRevision);
}

- (NSString)pendingVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u.%llu.%u"), self->_pendingMajor, self->_pendingMinor, self->_pendingRevision);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v10.receiver = self;
  v10.super_class = (Class)B2PBudVersionGetResponse;
  -[B2PResponse description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[B2PBudVersionGetResponse activeVersion](self, "activeVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tActive Version: %@\n"), v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("\tActive File: %u\n"), -[B2PBudVersionGetResponse activeFile](self, "activeFile"));
  -[B2PBudVersionGetResponse pendingVersion](self, "pendingVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tPending Version: %@\n"), v7);

  objc_msgSend(v5, "appendFormat:", CFSTR("\tPending File: %u\n"), -[B2PBudVersionGetResponse pendingFile](self, "pendingFile"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)activeMajor
{
  return self->_activeMajor;
}

- (unint64_t)activeMinor
{
  return self->_activeMinor;
}

- (unsigned)activeRevision
{
  return self->_activeRevision;
}

- (unsigned)pendingMajor
{
  return self->_pendingMajor;
}

- (unint64_t)pendingMinor
{
  return self->_pendingMinor;
}

- (unsigned)pendingRevision
{
  return self->_pendingRevision;
}

- (unsigned)activeFile
{
  return self->_activeFile;
}

- (unsigned)pendingFile
{
  return self->_pendingFile;
}

@end
