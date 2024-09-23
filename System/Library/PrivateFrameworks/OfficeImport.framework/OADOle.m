@implementation OADOle

- (OADOle)init
{
  OADOle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADOle;
  result = -[OADOle init](&v3, sel_init);
  if (result)
    result->mWinClipboardFormat = 0;
  return result;
}

- (void)setCLSID:(id)a3
{
  objc_storeStrong((id *)&self->mCLSID, a3);
}

- (id)CLSID
{
  return self->mCLSID;
}

- (void)setAnsiUserType:(id)a3
{
  objc_storeStrong((id *)&self->mAnsiUserType, a3);
}

- (void)setAnsiClipboardFormatName:(id)a3
{
  objc_storeStrong((id *)&self->mAnsiClipboardFormatName, a3);
}

- (void)setAnsiProgID:(id)a3
{
  objc_storeStrong((id *)&self->mAnsiProgID, a3);
}

- (void)setUnicodeUserType:(id)a3
{
  objc_storeStrong((id *)&self->mUnicodeUserType, a3);
}

- (void)setUnicodeClipboardFormatName:(id)a3
{
  objc_storeStrong((id *)&self->mUnicodeClipboardFormatName, a3);
}

- (void)setUnicodeProgID:(id)a3
{
  objc_storeStrong((id *)&self->mUnicodeProgID, a3);
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->mObject, a3);
}

- (void)setMacClipboardFormat:(id)a3
{
  objc_storeStrong((id *)&self->mMacClipboardFormat, a3);
}

- (void)setIconic:(BOOL)a3
{
  self->mIconic = a3;
}

- (BOOL)iconic
{
  return self->mIconic;
}

- (id)ansiUserType
{
  return self->mAnsiUserType;
}

- (id)ansiClipboardFormatName
{
  return self->mAnsiClipboardFormatName;
}

- (unsigned)winClipboardFormat
{
  return self->mWinClipboardFormat;
}

- (void)setWinClipboardFormat:(unsigned int)a3
{
  self->mWinClipboardFormat = a3;
}

- (id)macClipboardFormat
{
  return self->mMacClipboardFormat;
}

- (id)ansiProgID
{
  return self->mAnsiProgID;
}

- (id)unicodeUserType
{
  return self->mUnicodeUserType;
}

- (id)unicodeClipboardFormatName
{
  return self->mUnicodeClipboardFormatName;
}

- (id)unicodeProgID
{
  return self->mUnicodeProgID;
}

- (id)object
{
  return self->mObject;
}

+ (BOOL)isProgIDChart:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("MSGraph.Chart.")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("Excel.Sheet.")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Excel.Chart."));
  }

  return v4;
}

+ (BOOL)isProgIDMathType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("Equation.DSMT4")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("Equation.DSMT36")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Equation"));
  }

  return v4;
}

+ (BOOL)isCLSIDSupported:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
  if (!+[OADOle isCLSIDSupported:]::classIdSet)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("00020820-0000-0000-C000-000000000046"), CFSTR("00020803-0000-0000-C000-000000000046"), CFSTR("00020821-0000-0000-C000-000000000046"), CFSTR("00020801-0000-0000-C000-000000000046"), 0);
    v6 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
    +[OADOle isCLSIDSupported:]::classIdSet = v5;

    v4 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
  }
  v7 = objc_msgSend(v4, "containsObject:", v3);

  return v7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADOle;
  -[OADOle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mObject, 0);
  objc_storeStrong((id *)&self->mUnicodeProgID, 0);
  objc_storeStrong((id *)&self->mUnicodeClipboardFormatName, 0);
  objc_storeStrong((id *)&self->mUnicodeUserType, 0);
  objc_storeStrong((id *)&self->mAnsiProgID, 0);
  objc_storeStrong((id *)&self->mMacClipboardFormat, 0);
  objc_storeStrong((id *)&self->mAnsiClipboardFormatName, 0);
  objc_storeStrong((id *)&self->mAnsiUserType, 0);
  objc_storeStrong((id *)&self->mCLSID, 0);
}

@end
