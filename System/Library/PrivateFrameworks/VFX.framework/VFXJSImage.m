@implementation VFXJSImage

+ (id)imageWithURL:(id)a3
{
  return (id)((uint64_t (*)(_QWORD, char *, id))MEMORY[0x1E0DE7D20])(MEMORY[0x1E0DC3870], sel_imageWithContentsOfFile_, a3);
}

+ (id)imageWithPath:(id)a3
{
  return (id)((uint64_t (*)(_QWORD, char *, id))MEMORY[0x1E0DE7D20])(MEMORY[0x1E0DC3870], sel_imageWithContentsOfFile_, a3);
}

+ (id)VFXJSExportProtocol
{
  return &unk_1EF024588;
}

@end
