@implementation SKUIStoreNotes

- (NSString)standardNotes
{
  return self->_standardNotes;
}

- (void)setStandardNotes:(id)a3
{
  objc_storeStrong((id *)&self->_standardNotes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardNotes, 0);
}

@end
