@implementation VUIMutableBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBookmarkTime:(double)a3
{
  void *v4;

  -[VUIBookmark _setBookmarkTimeWithoutUpdatingTimestamp:](self, "_setBookmarkTimeWithoutUpdatingTimestamp:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBookmark _setBookmarkTimestamp:](self, "_setBookmarkTimestamp:", v4);

  -[VUIBookmark setHasFakeTimestamp:](self, "setHasFakeTimestamp:", 1);
}

- (void)setBookmarkTimestamp:(id)a3
{
  -[VUIBookmark _setBookmarkTimestamp:](self, "_setBookmarkTimestamp:", a3);
  -[VUIBookmark setHasFakeTimestamp:](self, "setHasFakeTimestamp:", 0);
}

@end
