@implementation UIImage

+ (id)tabLibrary
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("music.square.stack.fill"));
}

+ (id)tabHome
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("home.fill"));
}

+ (id)tabBrowse
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("square.grid.2x2.fill"));
}

+ (id)tabRadio
{
  return objc_msgSend(a1, "systemImageNamed:", CFSTR("dot.radiowaves.left.and.right"));
}

+ (id)artistPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("music.mic"));
}

+ (id)albumPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("music.square.stack"));
}

+ (id)playlistPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("music.note.list"));
}

+ (id)geniusPlaylistPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("genius"));
}

+ (id)smartPlaylistPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("gearshape"));
}

+ (id)playlistFolderPlaceholder
{
  return objc_msgSend(a1, "_systemImageNamed:", CFSTR("folder"));
}

+ (id)playlistPlaceholderForPlaylistType:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "smartPlaylistPlaceholder"));
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playlistFolderPlaceholder"));
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "geniusPlaylistPlaceholder"));
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playlistPlaceholder"));
      break;
  }
  return v3;
}

+ (id)playlistPlaceholderForPlaylist:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasLoadedValueForKey:", MPModelPropertyPlaylistType))
    v5 = objc_msgSend(v4, "type");
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playlistPlaceholderForPlaylistType:", v5));

  return v6;
}

+ (id)defaultPlaceholderForTraitCollection:(id)a3
{
  return (id)CPUIImageNamedWithTraitCollection(CFSTR("PlaceholderMusic"), a3);
}

@end
