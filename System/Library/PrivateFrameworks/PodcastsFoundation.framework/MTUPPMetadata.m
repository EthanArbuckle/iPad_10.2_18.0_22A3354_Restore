@implementation MTUPPMetadata

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTUPPMetadata metadataIdentifier](self, "metadataIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUPPMetadata _playheadToString](self, "_playheadToString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MTUPPMetadata hasBeenPlayed](self, "hasBeenPlayed"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  v7 = -[MTUPPMetadata playCount](self, "playCount");
  v8 = (void *)MEMORY[0x1E0C99D68];
  -[MTUPPMetadata timestamp](self, "timestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Identifier <%@> Playhead <%@> Has been played <%@> Play count <%lld> Timestamp <%@>"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_playheadToString
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  -[MTUPPMetadata bookmarkTime](self, "bookmarkTime");
  v4 = (int)(v3 / 3600.0);
  -[MTUPPMetadata bookmarkTime](self, "bookmarkTime");
  v5 = (double)(3600 * (int)v4);
  v7 = (int)((v6 - v5) / 60.0);
  -[MTUPPMetadata bookmarkTime](self, "bookmarkTime");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%02d"), v4, v7, (int)(v8 - v5 - (double)(60 * (int)v7)));
}

@end
