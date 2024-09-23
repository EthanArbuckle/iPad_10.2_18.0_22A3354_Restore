@implementation TPSTipContentTextView

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
