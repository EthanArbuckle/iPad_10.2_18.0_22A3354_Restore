@implementation ChromeNavigationDisplayConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(self), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "cameraStyle");
    if (v7 == (id)-[ChromeNavigationDisplayConfiguration cameraStyle](self, "cameraStyle"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cameraPaused"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](self, "cameraPaused"));
      v10 = v8;
      v11 = v9;
      if (v10 | v11
        && (v12 = objc_msgSend((id)v10, "isEqual:", v11),
            (id)v11,
            (id)v10,
            !v12))
      {
        v20 = 0;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeGeniusEntry"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration routeGeniusEntry](self, "routeGeniusEntry"));
        v15 = v13;
        v16 = v14;
        if (v15 | v16
          && (v17 = objc_msgSend((id)v15, "isEqual:", v16),
              (id)v16,
              (id)v15,
              !v17))
        {
          v20 = 0;
        }
        else
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "showsRoadLabel"));
          v19 = objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](self, "showsRoadLabel"));
          if (v18 | v19)
            v20 = objc_msgSend((id)v18, "isEqual:", v19);
          else
            v20 = 1;

        }
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ChromeNavigationDisplayConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_opt_new(ChromeNavigationDisplayConfiguration);
  -[ChromeNavigationDisplayConfiguration setCameraStyle:](v4, "setCameraStyle:", -[ChromeNavigationDisplayConfiguration cameraStyle](self, "cameraStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](self, "cameraPaused"));
  -[ChromeNavigationDisplayConfiguration setCameraPaused:](v4, "setCameraPaused:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration routeGeniusEntry](self, "routeGeniusEntry"));
  -[ChromeNavigationDisplayConfiguration setRouteGeniusEntry:](v4, "setRouteGeniusEntry:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](self, "showsRoadLabel"));
  -[ChromeNavigationDisplayConfiguration setShowsRoadLabel:](v4, "setShowsRoadLabel:", v7);

  return v4;
}

- (void)mergeWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    if (objc_msgSend(v4, "cameraStyle"))
      -[ChromeNavigationDisplayConfiguration setCameraStyle:](self, "setCameraStyle:", objc_msgSend(v11, "cameraStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cameraPaused"));
    if (v5)
    {
      -[ChromeNavigationDisplayConfiguration setCameraPaused:](self, "setCameraPaused:", v5);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](self, "cameraPaused"));
      -[ChromeNavigationDisplayConfiguration setCameraPaused:](self, "setCameraPaused:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeGeniusEntry"));
    if (v7)
    {
      -[ChromeNavigationDisplayConfiguration setRouteGeniusEntry:](self, "setRouteGeniusEntry:", v7);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration routeGeniusEntry](self, "routeGeniusEntry"));
      -[ChromeNavigationDisplayConfiguration setRouteGeniusEntry:](self, "setRouteGeniusEntry:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "showsRoadLabel"));
    if (v9)
    {
      -[ChromeNavigationDisplayConfiguration setShowsRoadLabel:](self, "setShowsRoadLabel:", v9);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](self, "showsRoadLabel"));
      -[ChromeNavigationDisplayConfiguration setShowsRoadLabel:](self, "setShowsRoadLabel:", v10);

    }
    v4 = v11;
  }

}

- (id)description
{
  ChromeNavigationDisplayConfiguration *v2;
  ChromeNavigationDisplayConfiguration *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  const __CFString *v30;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ((objc_opt_respondsToSelector(v3, "accessibilityIdentifier") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration performSelector:](v3, "performSelector:", "accessibilityIdentifier"));
      v8 = v7;
      if (v7 && !objc_msgSend(v7, "isEqualToString:", v6))
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v6, v3, v8));

        goto LABEL_7;
      }

    }
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v6, v3));
LABEL_7:

    goto LABEL_9;
  }
  v9 = CFSTR("<nil>");
LABEL_9:

  v10 = -[ChromeNavigationDisplayConfiguration cameraStyle](v3, "cameraStyle");
  if (v10 > 4)
    v11 = CFSTR(".Unknown");
  else
    v11 = *(&off_1011E7258 + v10);
  v30 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](v3, "cameraPaused"));
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "BOOLValue"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
  }
  else
  {
    v15 = CFSTR("<nil>");
  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration routeGeniusEntry](v3, "routeGeniusEntry"));
  v17 = v16;
  if (v16)
  {
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_24;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_24:

    goto LABEL_26;
  }
  v23 = CFSTR("<nil>");
LABEL_26:

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](v3, "showsRoadLabel"));
  v25 = v24;
  if (v24)
  {
    if (objc_msgSend(v24, "BOOLValue"))
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v27 = v26;
  }
  else
  {
    v27 = CFSTR("<nil>");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (cameraStyle:%@, cameraPaused:%@, routeGeniusEntry:%@, showsRoadLabel:%@)"), v9, v30, v15, v23, v27));

  return v28;
}

+ (BOOL)_cameraStyleRequiresCameraMotion:(int64_t)a3
{
  return a3 != 0;
}

- (int64_t)cameraStyle
{
  return self->_cameraStyle;
}

- (void)setCameraStyle:(int64_t)a3
{
  self->_cameraStyle = a3;
}

- (NSNumber)cameraPaused
{
  return self->_cameraPaused;
}

- (void)setCameraPaused:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (void)setRouteGeniusEntry:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, a3);
}

- (NSNumber)showsRoadLabel
{
  return self->_showsRoadLabel;
}

- (void)setShowsRoadLabel:(id)a3
{
  objc_storeStrong((id *)&self->_showsRoadLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showsRoadLabel, 0);
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);
  objc_storeStrong((id *)&self->_cameraPaused, 0);
}

@end
