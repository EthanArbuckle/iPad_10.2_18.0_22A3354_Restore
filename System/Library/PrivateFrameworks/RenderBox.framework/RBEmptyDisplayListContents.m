@implementation RBEmptyDisplayListContents

- (BOOL)isEmpty
{
  return 1;
}

+ (uint64_t)shared
{
  unsigned __int8 v0;

  objc_opt_self();
  {
    +[RBEmptyDisplayListContents shared]::shared = objc_opt_new();
  }
  return +[RBEmptyDisplayListContents shared]::shared;
}

- (CGRect)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (const)_rb_contents
{
  return 0;
}

- (const)_rb_xml_document
{
  unsigned __int8 v2;
  RB::XML::Document *v4;

  if ((v2 & 1) == 0
  {
    v4 = (RB::XML::Document *)operator new();
    RB::XML::Document::Document(v4);
    -[RBEmptyDisplayListContents _rb_xml_document]::shared_doc = (uint64_t)v4;
  }
  return (const void *)-[RBEmptyDisplayListContents _rb_xml_document]::shared_doc;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  unsigned __int8 v6;
  RB::DisplayList::Contents *v8;

  if ((v6 & 1) == 0
  {
    v8 = (RB::DisplayList::Contents *)operator new();
    RB::DisplayList::Contents::Contents(v8, 0);
    -[RBEmptyDisplayListContents encodedDataForDelegate:error:]::empty = (uint64_t)v8;
  }
  return encode_contents((RB::DisplayList::Contents *)-[RBEmptyDisplayListContents encodedDataForDelegate:error:]::empty, a3, a4);
}

@end
