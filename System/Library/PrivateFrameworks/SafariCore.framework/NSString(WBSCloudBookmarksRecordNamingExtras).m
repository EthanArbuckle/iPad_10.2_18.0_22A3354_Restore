@implementation NSString(WBSCloudBookmarksRecordNamingExtras)

- (uint64_t)safari_isSpecialFolderRecordName
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("Favorites Bar")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("Bookmarks Menu")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("Reading List")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.Safari.TopBookmark"));
  }
}

@end
