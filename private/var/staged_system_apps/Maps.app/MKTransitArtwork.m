@implementation MKTransitArtwork

+ (id)stationNodeArtworkWithHexColor:(id)a3
{
  return _objc_msgSend(a1, "_shieldWithType:hexColorString:accessibilityText:", 280000, a3, 0);
}

+ (id)stationNodeOutlinedArtworkWithHexColor:(id)a3
{
  return _objc_msgSend(a1, "_shieldWithType:hexColorString:accessibilityText:", 280001, a3, 0);
}

+ (id)_shieldWithType:(int64_t)a3 hexColorString:(id)a4 accessibilityText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)MKTransitShield), "initWithShieldType:text:color:", a3, 0, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork artworkWithShield:accessibilityText:](MKTransitArtwork, "artworkWithShield:accessibilityText:", v9, v7));
  return v10;
}

@end
