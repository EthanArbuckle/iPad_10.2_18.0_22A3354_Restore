@implementation BRCBouncingReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t BouncingCountOnSameType;
  id v5;

  BouncingCountOnSameType = self->BouncingCountOnSameType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", BouncingCountOnSameType, CFSTR("BouncingCountOnSameType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDirToLnk, CFSTR("BouncingCountFromDirToLnk"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDirToAls, CFSTR("BouncingCountFromDirToAls"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDirToPkg, CFSTR("BouncingCountFromDirToPkg"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDirToDoc, CFSTR("BouncingCountFromDirToDoc"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromLnkToDir, CFSTR("BouncingCountFromLnkToDir"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromLnkToAls, CFSTR("BouncingCountFromLnkToAls"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromLnkToPkg, CFSTR("BouncingCountFromLnkToPkg"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromLnkToDoc, CFSTR("BouncingCountFromLnkToDoc"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromAlsToDir, CFSTR("BouncingCountFromAlsToDir"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromAlsToLnk, CFSTR("BouncingCountFromAlsToLnk"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromAlsToPkg, CFSTR("BouncingCountFromAlsToPkg"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromAlsToDoc, CFSTR("BouncingCountFromAlsToDoc"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromPkgToDir, CFSTR("BouncingCountFromPkgToDir"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromPkgToLnk, CFSTR("BouncingCountFromPkgToLnk"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromPkgToAls, CFSTR("BouncingCountFromPkgToAls"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromPkgToDoc, CFSTR("BouncingCountFromPkgToDoc"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDocToDir, CFSTR("BouncingCountFromDocToDir"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDocToLnk, CFSTR("BouncingCountFromDocToLnk"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDocToAls, CFSTR("BouncingCountFromDocToAls"));
  objc_msgSend(v5, "encodeInt:forKey:", self->BouncingCountFromDocToPkg, CFSTR("BouncingCountFromDocToPkg"));

}

- (BRCBouncingReport)initWithCoder:(id)a3
{
  id v4;
  BRCBouncingReport *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCBouncingReport;
  v5 = -[BRCBouncingReport init](&v7, sel_init);
  if (v5)
  {
    v5->BouncingCountOnSameType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountOnSameType"));
    v5->BouncingCountFromDirToLnk = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDirToLnk"));
    v5->BouncingCountFromDirToAls = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDirToAls"));
    v5->BouncingCountFromDirToPkg = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDirToPkg"));
    v5->BouncingCountFromDirToDoc = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDirToDoc"));
    v5->BouncingCountFromLnkToDir = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromLnkToDir"));
    v5->BouncingCountFromLnkToAls = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromLnkToAls"));
    v5->BouncingCountFromLnkToPkg = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromLnkToPkg"));
    v5->BouncingCountFromLnkToDoc = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromLnkToDoc"));
    v5->BouncingCountFromAlsToDir = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromAlsToDir"));
    v5->BouncingCountFromAlsToLnk = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromAlsToLnk"));
    v5->BouncingCountFromAlsToPkg = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromAlsToPkg"));
    v5->BouncingCountFromAlsToDoc = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromAlsToDoc"));
    v5->BouncingCountFromPkgToDir = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromPkgToDir"));
    v5->BouncingCountFromPkgToLnk = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromPkgToLnk"));
    v5->BouncingCountFromPkgToAls = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromPkgToAls"));
    v5->BouncingCountFromPkgToDoc = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromPkgToDoc"));
    v5->BouncingCountFromDocToDir = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDocToDir"));
    v5->BouncingCountFromDocToLnk = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDocToLnk"));
    v5->BouncingCountFromDocToAls = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDocToAls"));
    v5->BouncingCountFromDocToPkg = objc_msgSend(v4, "decodeIntForKey:", CFSTR("BouncingCountFromDocToPkg"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p st:%u d2l:%u d2a:%u d2p:%u d2f:%u l2d:%u l2a:%u l2p:%u l2f:%u a2d:%u a2l:%u a2p:%u a2f:%u p2d:%u p2l:%u p2a:%u p2f:%u f2d:%u f2l:%u f2a:%u f2p:%u>"), objc_opt_class(), self, -[BRCBouncingReport BouncingCountOnSameType](self, "BouncingCountOnSameType"), -[BRCBouncingReport BouncingCountFromDirToLnk](self, "BouncingCountFromDirToLnk"), -[BRCBouncingReport BouncingCountFromDirToAls](self, "BouncingCountFromDirToAls"), -[BRCBouncingReport BouncingCountFromDirToPkg](self, "BouncingCountFromDirToPkg"), -[BRCBouncingReport BouncingCountFromDirToDoc](self, "BouncingCountFromDirToDoc"), -[BRCBouncingReport BouncingCountFromLnkToDir](self, "BouncingCountFromLnkToDir"), -[BRCBouncingReport BouncingCountFromLnkToAls](self, "BouncingCountFromLnkToAls"), -[BRCBouncingReport BouncingCountFromLnkToPkg](self, "BouncingCountFromLnkToPkg"), -[BRCBouncingReport BouncingCountFromLnkToDoc](self, "BouncingCountFromLnkToDoc"), -[BRCBouncingReport BouncingCountFromAlsToDir](self, "BouncingCountFromAlsToDir"), -[BRCBouncingReport BouncingCountFromAlsToLnk](self, "BouncingCountFromAlsToLnk"), -[BRCBouncingReport BouncingCountFromAlsToPkg](self, "BouncingCountFromAlsToPkg"), -[BRCBouncingReport BouncingCountFromAlsToDoc](self, "BouncingCountFromAlsToDoc"), -[BRCBouncingReport BouncingCountFromPkgToDir](self, "BouncingCountFromPkgToDir"),
               -[BRCBouncingReport BouncingCountFromPkgToLnk](self, "BouncingCountFromPkgToLnk"),
               -[BRCBouncingReport BouncingCountFromPkgToAls](self, "BouncingCountFromPkgToAls"),
               -[BRCBouncingReport BouncingCountFromPkgToDoc](self, "BouncingCountFromPkgToDoc"),
               -[BRCBouncingReport BouncingCountFromDocToDir](self, "BouncingCountFromDocToDir"),
               -[BRCBouncingReport BouncingCountFromDocToLnk](self, "BouncingCountFromDocToLnk"),
               -[BRCBouncingReport BouncingCountFromDocToAls](self, "BouncingCountFromDocToAls"),
               -[BRCBouncingReport BouncingCountFromDocToPkg](self, "BouncingCountFromDocToPkg"));
}

- (unsigned)BouncingCountOnSameType
{
  return self->BouncingCountOnSameType;
}

- (void)setBouncingCountOnSameType:(unsigned int)a3
{
  self->BouncingCountOnSameType = a3;
}

- (unsigned)BouncingCountFromDirToLnk
{
  return self->BouncingCountFromDirToLnk;
}

- (void)setBouncingCountFromDirToLnk:(unsigned int)a3
{
  self->BouncingCountFromDirToLnk = a3;
}

- (unsigned)BouncingCountFromDirToAls
{
  return self->BouncingCountFromDirToAls;
}

- (void)setBouncingCountFromDirToAls:(unsigned int)a3
{
  self->BouncingCountFromDirToAls = a3;
}

- (unsigned)BouncingCountFromDirToPkg
{
  return self->BouncingCountFromDirToPkg;
}

- (void)setBouncingCountFromDirToPkg:(unsigned int)a3
{
  self->BouncingCountFromDirToPkg = a3;
}

- (unsigned)BouncingCountFromDirToDoc
{
  return self->BouncingCountFromDirToDoc;
}

- (void)setBouncingCountFromDirToDoc:(unsigned int)a3
{
  self->BouncingCountFromDirToDoc = a3;
}

- (unsigned)BouncingCountFromLnkToDir
{
  return self->BouncingCountFromLnkToDir;
}

- (void)setBouncingCountFromLnkToDir:(unsigned int)a3
{
  self->BouncingCountFromLnkToDir = a3;
}

- (unsigned)BouncingCountFromLnkToAls
{
  return self->BouncingCountFromLnkToAls;
}

- (void)setBouncingCountFromLnkToAls:(unsigned int)a3
{
  self->BouncingCountFromLnkToAls = a3;
}

- (unsigned)BouncingCountFromLnkToPkg
{
  return self->BouncingCountFromLnkToPkg;
}

- (void)setBouncingCountFromLnkToPkg:(unsigned int)a3
{
  self->BouncingCountFromLnkToPkg = a3;
}

- (unsigned)BouncingCountFromLnkToDoc
{
  return self->BouncingCountFromLnkToDoc;
}

- (void)setBouncingCountFromLnkToDoc:(unsigned int)a3
{
  self->BouncingCountFromLnkToDoc = a3;
}

- (unsigned)BouncingCountFromAlsToDir
{
  return self->BouncingCountFromAlsToDir;
}

- (void)setBouncingCountFromAlsToDir:(unsigned int)a3
{
  self->BouncingCountFromAlsToDir = a3;
}

- (unsigned)BouncingCountFromAlsToLnk
{
  return self->BouncingCountFromAlsToLnk;
}

- (void)setBouncingCountFromAlsToLnk:(unsigned int)a3
{
  self->BouncingCountFromAlsToLnk = a3;
}

- (unsigned)BouncingCountFromAlsToPkg
{
  return self->BouncingCountFromAlsToPkg;
}

- (void)setBouncingCountFromAlsToPkg:(unsigned int)a3
{
  self->BouncingCountFromAlsToPkg = a3;
}

- (unsigned)BouncingCountFromAlsToDoc
{
  return self->BouncingCountFromAlsToDoc;
}

- (void)setBouncingCountFromAlsToDoc:(unsigned int)a3
{
  self->BouncingCountFromAlsToDoc = a3;
}

- (unsigned)BouncingCountFromPkgToDir
{
  return self->BouncingCountFromPkgToDir;
}

- (void)setBouncingCountFromPkgToDir:(unsigned int)a3
{
  self->BouncingCountFromPkgToDir = a3;
}

- (unsigned)BouncingCountFromPkgToLnk
{
  return self->BouncingCountFromPkgToLnk;
}

- (void)setBouncingCountFromPkgToLnk:(unsigned int)a3
{
  self->BouncingCountFromPkgToLnk = a3;
}

- (unsigned)BouncingCountFromPkgToAls
{
  return self->BouncingCountFromPkgToAls;
}

- (void)setBouncingCountFromPkgToAls:(unsigned int)a3
{
  self->BouncingCountFromPkgToAls = a3;
}

- (unsigned)BouncingCountFromPkgToDoc
{
  return self->BouncingCountFromPkgToDoc;
}

- (void)setBouncingCountFromPkgToDoc:(unsigned int)a3
{
  self->BouncingCountFromPkgToDoc = a3;
}

- (unsigned)BouncingCountFromDocToDir
{
  return self->BouncingCountFromDocToDir;
}

- (void)setBouncingCountFromDocToDir:(unsigned int)a3
{
  self->BouncingCountFromDocToDir = a3;
}

- (unsigned)BouncingCountFromDocToLnk
{
  return self->BouncingCountFromDocToLnk;
}

- (void)setBouncingCountFromDocToLnk:(unsigned int)a3
{
  self->BouncingCountFromDocToLnk = a3;
}

- (unsigned)BouncingCountFromDocToAls
{
  return self->BouncingCountFromDocToAls;
}

- (void)setBouncingCountFromDocToAls:(unsigned int)a3
{
  self->BouncingCountFromDocToAls = a3;
}

- (unsigned)BouncingCountFromDocToPkg
{
  return self->BouncingCountFromDocToPkg;
}

- (void)setBouncingCountFromDocToPkg:(unsigned int)a3
{
  self->BouncingCountFromDocToPkg = a3;
}

@end
