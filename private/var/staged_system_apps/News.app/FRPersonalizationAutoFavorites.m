@implementation FRPersonalizationAutoFavorites

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites autoFavoriteTagIDsToScores](self, "autoFavoriteTagIDsToScores"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("autoFavoriteTagIDsToScores"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites groupableFavoriteTagIDs](self, "groupableFavoriteTagIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupableFavoriteTagIDs"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites defaultCandidates](self, "defaultCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("defaultCandidates"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites internalSignalAutoFavoriteCandidates](self, "internalSignalAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("internalSignalAutoFavoriteCandidates"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites existingInternalSignalAutoFavoriteCandidates](self, "existingInternalSignalAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("existingInternalSignalAutoFavoriteCandidates"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites groupableCandidates](self, "groupableCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("groupableCandidates"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites portraitAutoFavoriteCandidates](self, "portraitAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("portraitAutoFavoriteCandidates"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites appUsageAutoFavoriteCandidates](self, "appUsageAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("appUsageAutoFavoriteCandidates"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites safariAutoFavoriteCandidates](self, "safariAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("safariAutoFavoriteCandidates"));

  v14 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites locationAutoFavoriteCandidates](self, "locationAutoFavoriteCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("locationAutoFavoriteCandidates"));

}

- (FRPersonalizationAutoFavorites)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FRPersonalizationAutoFavorites *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FRPersonalizationAutoFavorites;
  v6 = -[FRPersonalizationAutoFavorites init](&v29, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSDictionary, v5);
    v9 = objc_opt_class(NSString, v8);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, objc_opt_class(NSNumber, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14 = objc_opt_class(NSSet, v13);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(NSString, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("autoFavoriteTagIDsToScores")));
    -[FRPersonalizationAutoFavorites setAutoFavoriteTagIDsToScores:](v6, "setAutoFavoriteTagIDsToScores:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("groupableFavoriteTagIDs")));
    -[FRPersonalizationAutoFavorites setGroupableFavoriteTagIDs:](v6, "setGroupableFavoriteTagIDs:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("defaultCandidates")));
    -[FRPersonalizationAutoFavorites setDefaultCandidates:](v6, "setDefaultCandidates:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("internalSignalAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setInternalSignalAutoFavoriteCandidates:](v6, "setInternalSignalAutoFavoriteCandidates:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("existingInternalSignalAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setExistingInternalSignalAutoFavoriteCandidates:](v6, "setExistingInternalSignalAutoFavoriteCandidates:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("groupableCandidates")));
    -[FRPersonalizationAutoFavorites setGroupableCandidates:](v6, "setGroupableCandidates:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("portraitAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setPortraitAutoFavoriteCandidates:](v6, "setPortraitAutoFavoriteCandidates:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("appUsageAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setAppUsageAutoFavoriteCandidates:](v6, "setAppUsageAutoFavoriteCandidates:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("safariAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setSafariAutoFavoriteCandidates:](v6, "setSafariAutoFavoriteCandidates:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("locationAutoFavoriteCandidates")));
    -[FRPersonalizationAutoFavorites setLocationAutoFavoriteCandidates:](v6, "setLocationAutoFavoriteCandidates:", v27);

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSafariAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPortraitAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLocationAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setInternalSignalAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setGroupableFavoriteTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setGroupableCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setExistingInternalSignalAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDefaultCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAutoFavoriteTagIDsToScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAppUsageAutoFavoriteCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)safariAutoFavoriteCandidates
{
  return self->_safariAutoFavoriteCandidates;
}

- (NSSet)portraitAutoFavoriteCandidates
{
  return self->_portraitAutoFavoriteCandidates;
}

- (NSSet)locationAutoFavoriteCandidates
{
  return self->_locationAutoFavoriteCandidates;
}

- (NSSet)internalSignalAutoFavoriteCandidates
{
  return self->_internalSignalAutoFavoriteCandidates;
}

- (NSSet)groupableFavoriteTagIDs
{
  return self->_groupableFavoriteTagIDs;
}

- (NSSet)groupableCandidates
{
  return self->_groupableCandidates;
}

- (NSSet)existingInternalSignalAutoFavoriteCandidates
{
  return self->_existingInternalSignalAutoFavoriteCandidates;
}

- (NSSet)defaultCandidates
{
  return self->_defaultCandidates;
}

- (NSDictionary)autoFavoriteTagIDsToScores
{
  return self->_autoFavoriteTagIDsToScores;
}

- (NSSet)appUsageAutoFavoriteCandidates
{
  return self->_appUsageAutoFavoriteCandidates;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites autoFavoriteTagIDsToScores](self, "autoFavoriteTagIDsToScores"));
  objc_msgSend(v4, "setAutoFavoriteTagIDsToScores:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites groupableFavoriteTagIDs](self, "groupableFavoriteTagIDs"));
  objc_msgSend(v4, "setGroupableFavoriteTagIDs:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites defaultCandidates](self, "defaultCandidates"));
  objc_msgSend(v4, "setDefaultCandidates:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites internalSignalAutoFavoriteCandidates](self, "internalSignalAutoFavoriteCandidates"));
  objc_msgSend(v4, "setInternalSignalAutoFavoriteCandidates:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites existingInternalSignalAutoFavoriteCandidates](self, "existingInternalSignalAutoFavoriteCandidates"));
  objc_msgSend(v4, "setExistingInternalSignalAutoFavoriteCandidates:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites groupableCandidates](self, "groupableCandidates"));
  objc_msgSend(v4, "setGroupableCandidates:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites portraitAutoFavoriteCandidates](self, "portraitAutoFavoriteCandidates"));
  objc_msgSend(v4, "setPortraitAutoFavoriteCandidates:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites appUsageAutoFavoriteCandidates](self, "appUsageAutoFavoriteCandidates"));
  objc_msgSend(v4, "setAppUsageAutoFavoriteCandidates:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites safariAutoFavoriteCandidates](self, "safariAutoFavoriteCandidates"));
  objc_msgSend(v4, "setSafariAutoFavoriteCandidates:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites locationAutoFavoriteCandidates](self, "locationAutoFavoriteCandidates"));
  objc_msgSend(v4, "setLocationAutoFavoriteCandidates:", v14);

  return v4;
}

- (NSSet)autoFavoriteTagIDs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites autoFavoriteTagIDsToScores](self, "autoFavoriteTagIDsToScores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (id)activeAppUsageAutoFavorites
{
  NSSet *v3;
  NSSet *v4;
  void *v5;
  void *v6;

  v3 = (NSSet *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites appUsageAutoFavoriteCandidates](self, "appUsageAutoFavoriteCandidates"));
  v4 = v3;
  if (!v3)
    v4 = objc_opt_new(NSSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavorites autoFavoriteTagIDs](self, "autoFavoriteTagIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet fc_setByIntersectingSet:](v4, "fc_setByIntersectingSet:", v5));

  if (!v3)
  return v6;
}

- (id)activeSafariAutoFavorites
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034854;
  v3[3] = &unk_1000DB648;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet fc_set:](NSSet, "fc_set:", v3));
}

- (id)activePortraitAutoFavorites
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034950;
  v3[3] = &unk_1000DB648;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet fc_set:](NSSet, "fc_set:", v3));
}

- (id)activeLocationAutoFavorites
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034A6C;
  v3[3] = &unk_1000DB648;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet fc_set:](NSSet, "fc_set:", v3));
}

- (id)activeInternalUsageAutoFavorites
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034BA8;
  v3[3] = &unk_1000DB648;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet fc_set:](NSSet, "fc_set:", v3));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_safariAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_appUsageAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_portraitAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_groupableCandidates, 0);
  objc_storeStrong((id *)&self->_existingInternalSignalAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_internalSignalAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_defaultCandidates, 0);
  objc_storeStrong((id *)&self->_groupableFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDsToScores, 0);
}

@end
