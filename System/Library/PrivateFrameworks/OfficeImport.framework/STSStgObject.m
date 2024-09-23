@implementation STSStgObject

- (STSStgObject)init
{
  STSStgObject *v2;
  STSStgObject *v3;
  STSStgObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSStgObject;
  v2 = -[STSStgObject init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (void)throwIfError:(int)a3
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;

  switch(a3)
  {
    case 0:
      return;
    case 1:
      v3 = CFSTR("STFileNotFound");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a file not found exception.");
      goto LABEL_20;
    case 2:
      v3 = CFSTR("STIllegalAccess");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated an illegal access exception.");
      goto LABEL_20;
    case 3:
      v3 = CFSTR("STFileNotSStg");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a file not structured storage exception.");
      goto LABEL_20;
    case 4:
      v3 = CFSTR("STFileIO");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a file I/O exception.");
      goto LABEL_20;
    case 5:
      v3 = CFSTR("STMemory");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a memory exception.");
      goto LABEL_20;
    case 6:
      v3 = CFSTR("STIllegalCall");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated an illegal call exception.");
      goto LABEL_20;
    case 7:
      v3 = CFSTR("STStgLocked");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a storage locked exception.");
      goto LABEL_20;
    case 8:
      v3 = CFSTR("STCorruptedFAT");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a corrupted FAT exception.");
      goto LABEL_20;
    case 9:
      v3 = CFSTR("STNotStorage");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a not storage exception.");
      goto LABEL_20;
    case 10:
      v3 = CFSTR("STNotStream");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a not stream exception.");
      goto LABEL_20;
    case 11:
      v3 = CFSTR("STChildNotFound");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a child not found exception.");
      goto LABEL_20;
    case 12:
      v3 = CFSTR("STNotSupported");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a not supported excepiton.");
      goto LABEL_20;
    case 13:
      v3 = CFSTR("STPropertyNotFound");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a property not found exception.");
      goto LABEL_20;
    case 14:
      v3 = CFSTR("STPropertyFormat");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a property format exception.");
      goto LABEL_20;
    case 15:
      v3 = CFSTR("STEndOfStream");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated an end of stream exception.");
      goto LABEL_20;
    case 16:
      v3 = CFSTR("STCorruptedDirectory");
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = CFSTR("Structured storage library generated a corrupted directory exception.");
      goto LABEL_20;
    case 17:
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("STZeroLengthFile"), CFSTR("Structured storage library generated a zero length file exception."));
      goto LABEL_19;
    default:
LABEL_19:
      v4 = (void *)MEMORY[0x24BDBCE88];
      v3 = (const __CFString *)*MEMORY[0x24BDBCA98];
      v5 = CFSTR("Structured storage library generated a generic exception");
LABEL_20:
      objc_msgSend(v4, "raise:format:", v3, v5);
      return;
  }
}

@end
