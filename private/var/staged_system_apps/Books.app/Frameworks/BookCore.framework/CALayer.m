@implementation CALayer

- (BOOL)isPaused
{
  float v2;

  -[CALayer speed](self, "speed");
  return v2 == 0.0;
}

- (void)pause
{
  double v3;
  double v4;

  if (!-[CALayer isPaused](self, "isPaused"))
  {
    -[CALayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v4 = v3;
    LODWORD(v3) = 0;
    -[CALayer setSpeed:](self, "setSpeed:", v3);
    -[CALayer setTimeOffset:](self, "setTimeOffset:", v4);
  }
}

- (void)resume
{
  double v3;
  double v4;
  double v5;

  if (-[CALayer isPaused](self, "isPaused"))
  {
    -[CALayer timeOffset](self, "timeOffset");
    v4 = v3;
    LODWORD(v3) = 1.0;
    -[CALayer setSpeed:](self, "setSpeed:", v3);
    -[CALayer setTimeOffset:](self, "setTimeOffset:", 0.0);
    -[CALayer setBeginTime:](self, "setBeginTime:", 0.0);
    -[CALayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    -[CALayer setBeginTime:](self, "setBeginTime:", v5 - v4);
  }
}

- (void)_addSublayersToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v10, "_addSublayersToArray:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mask"));
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(v11, "_addSublayersToArray:", v4);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

@end
