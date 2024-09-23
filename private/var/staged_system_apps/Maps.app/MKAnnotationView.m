@implementation MKAnnotationView

+ (id)droppedPinTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Marked Location");
  else
    v5 = CFSTR("Dropped Pin");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

@end
