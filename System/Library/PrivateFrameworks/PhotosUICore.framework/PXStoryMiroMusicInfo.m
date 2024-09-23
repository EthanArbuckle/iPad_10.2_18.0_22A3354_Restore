@implementation PXStoryMiroMusicInfo

- (PXStoryMiroMusicInfo)initWithCoder:(id)a3
{
  id v4;
  PXStoryMiroMusicInfo *v5;
  uint64_t v6;
  NSString *flexMusicID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMiroMusicInfo;
  v5 = -[PXStoryMiroMusicInfo init](&v9, sel_init);
  if (v5 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("MoodiTunesMediaID")) & 1) == 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MoodSongDictID"));
    v6 = objc_claimAutoreleasedReturnValue();
    flexMusicID = v5->_flexMusicID;
    v5->_flexMusicID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryMiroMusicInfo flexMusicID](self, "flexMusicID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MoodSongDictID"));

}

- (NSString)flexMusicID
{
  return self->_flexMusicID;
}

- (void)setFlexMusicID:(id)a3
{
  objc_storeStrong((id *)&self->_flexMusicID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexMusicID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
