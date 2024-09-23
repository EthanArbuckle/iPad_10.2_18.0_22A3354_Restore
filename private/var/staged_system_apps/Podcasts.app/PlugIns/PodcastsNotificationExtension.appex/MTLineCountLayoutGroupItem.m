@implementation MTLineCountLayoutGroupItem

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (int64_t)maxLineCount
{
  return self->_maxLineCount;
}

- (void)setMaxLineCount:(int64_t)a3
{
  self->_maxLineCount = a3;
}

- (int64_t)sharingPriority
{
  return self->_sharingPriority;
}

- (void)setSharingPriority:(int64_t)a3
{
  self->_sharingPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
