@implementation RCPTraceLayer

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double c;
  double v11;
  double b;
  double a;
  double d;
  CGFloat ty;
  CGFloat tx;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t IntegerValue;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  char v38;
  void *v39;
  RCPFilePath *v40;
  void *v41;
  void *v42;
  _BOOL4 IsEmpty;
  CGPath *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGColorSpace *DeviceRGB;
  CGColor *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t i;
  void *v59;
  unint64_t time;
  unint64_t v61;
  double v62;
  unint64_t v63;
  unint64_t v64;
  CGColor *CopyWithAlpha;
  unint64_t v66;
  CGPoint CurrentPoint;
  double v68;
  unint64_t v69;
  unint64_t v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  double v80;
  unint64_t v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v93;
  _BYTE v94[128];
  CGFloat components[2];
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v98 = *MEMORY[0x1E0C80C00];
  -[RCPTraceLayer bounds](self, "bounds");
  CGContextClearRect(a3, v99);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPTraceLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  c = v9;
  b = v11;
  switch(-[RCPTraceLayer interfaceOrientation](self, "interfaceOrientation"))
  {
    case 0:
      CGAffineTransformMakeScale(&v93, c, b);
      a = v93.a;
      b = v93.b;
      c = v93.c;
      d = v93.d;
      tx = v93.tx;
      ty = v93.ty;
      break;
    case 1:
      a = -c;
      d = -b;
      ty = b;
      tx = c;
      c = 0.0;
      b = 0.0;
      break;
    case 2:
      ty = b;
      b = -b;
      tx = 0.0;
      goto LABEL_7;
    case 3:
      tx = c;
      c = -c;
      ty = 0.0;
LABEL_7:
      d = 0.0;
      a = 0.0;
      break;
    default:
      a = *MEMORY[0x1E0C9BAA8];
      b = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
      c = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
      d = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
      tx = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
      ty = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
      break;
  }
  CGAffineTransformMakeTranslation(&t2, v6, v8);
  t1.a = a;
  t1.b = b;
  t1.c = c;
  t1.d = d;
  t1.tx = tx;
  t1.ty = ty;
  CGAffineTransformConcat(&v93, &t1, &t2);
  v17 = v93.b;
  v80 = v93.a;
  v18 = v93.c;
  v19 = v93.d;
  v21 = v93.tx;
  v20 = v93.ty;
  -[RCPTraceLayer eventStream](self, "eventStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "environment");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[RCPTraceLayer eventStream](self, "eventStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "events");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  if (v76)
  {
    v75 = *(_QWORD *)v88;
LABEL_10:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v75)
        objc_enumerationMutation(v24);
      v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v25);
      if (objc_msgSend(v26, "timestamp", v74) >= self->_time)
        break;
      v77 = v25;
      objc_msgSend(v26, "hidEvent");
      IOHIDEventGetChildren();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        v28 = 0;
        do
        {
          objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          IntegerValue = IOHIDEventGetIntegerValue();

          objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          IOHIDEventGetFloatValue();
          v33 = v32;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          IOHIDEventGetFloatValue();
          v36 = v35;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = IOHIDEventGetIntegerValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectForKeyedSubscript:", v39);
          v40 = (RCPFilePath *)objc_claimAutoreleasedReturnValue();

          if ((v38 & 1) != 0)
          {
            if (v40)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "removeObjectForKey:", v41);

            }
            -[RCPFilePath setFinished:](v40, "setFinished:", 1);
          }
          else
          {
            if (v40)
            {
              -[RCPFilePath setEndTimestamp:](v40, "setEndTimestamp:", objc_msgSend(v26, "timestamp"));
            }
            else
            {
              v40 = objc_alloc_init(RCPFilePath);
              -[RCPFilePath setPath:](v40, "setPath:", CGPathCreateMutable());
              -[RCPFilePath setTimestamp:](v40, "setTimestamp:", objc_msgSend(v26, "timestamp"));
              -[RCPFilePath setEndTimestamp:](v40, "setEndTimestamp:", objc_msgSend(v26, "timestamp") + 100);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setObject:forKeyedSubscript:", v40, v42);

              objc_msgSend(v78, "addObject:", v40);
            }
            IsEmpty = CGPathIsEmpty(-[RCPFilePath path](v40, "path"));
            v44 = -[RCPFilePath path](v40, "path");
            v45 = v21 + v18 * v36 + v80 * v33;
            v46 = v20 + v19 * v36 + v17 * v33;
            if (IsEmpty)
              CGPathMoveToPoint(v44, 0, v45, v46);
            else
              CGPathAddLineToPoint(v44, 0, v45, v46);
          }

          ++v28;
        }
        while (v28 < objc_msgSend(v27, "count"));
      }

      v25 = v77 + 1;
      if (v77 + 1 == v76)
      {
        v76 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        if (v76)
          goto LABEL_10;
        break;
      }
    }
  }

  objc_msgSend(v74, "timeScale");
  v48 = v47;
  objc_msgSend(v74, "timeScale");
  v50 = v49;
  CGContextSetLineWidth(a3, 4.0);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
  CGContextSetLineCap(a3, kCGLineCapRound);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1A5EA8A80;
  v96 = unk_1A5EA8A90;
  v52 = CGColorCreate(DeviceRGB, components);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v53 = v78;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
  if (v54)
  {
    v55 = v54;
    v81 = (unint64_t)(100000000.0 / v48);
    v56 = *(_QWORD *)v84;
    v79 = (unint64_t)(300000000.0 / v50);
    v57 = (double)v79;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v84 != v56)
          objc_enumerationMutation(v53);
        v59 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        time = self->_time;
        if (time >= objc_msgSend(v59, "timestamp", v74))
        {
          if (!objc_msgSend(v59, "finished")
            || (v61 = self->_time, v61 <= objc_msgSend(v59, "endTimestamp") + v79))
          {
            v62 = 1.0;
            if (objc_msgSend(v59, "finished"))
            {
              v63 = self->_time;
              if (v63 > objc_msgSend(v59, "endTimestamp"))
              {
                v64 = self->_time;
                v62 = (1.0 - (double)(v64 - objc_msgSend(v59, "endTimestamp")) / v57) * 0.25;
              }
            }
            CGContextSetRGBStrokeColor(a3, 1.0, 1.0, 1.0, v62);
            CGContextAddPath(a3, (CGPathRef)objc_msgSend(v59, "path"));
            CGContextSetLineWidth(a3, 6.0);
            CGContextStrokePath(a3);
            CopyWithAlpha = CGColorCreateCopyWithAlpha(v52, v62);
            CGContextSetStrokeColorWithColor(a3, CopyWithAlpha);
            CGContextAddPath(a3, (CGPathRef)objc_msgSend(v59, "path"));
            CGContextSetLineWidth(a3, 4.0);
            CGContextStrokePath(a3);
            v66 = self->_time;
            if (v66 < objc_msgSend(v59, "endTimestamp") + v81)
            {
              CGContextSetFillColorWithColor(a3, v52);
              CurrentPoint = CGPathGetCurrentPoint((CGPathRef)objc_msgSend(v59, "path"));
              v68 = 16.0;
              if (objc_msgSend(v59, "finished"))
              {
                v69 = self->_time;
                if (v69 > objc_msgSend(v59, "endTimestamp"))
                {
                  v70 = self->_time;
                  v68 = (double)(v70 - objc_msgSend(v59, "endTimestamp")) * -10.0 / v57 + 16.0;
                }
              }
              v71 = CurrentPoint.x - v68;
              v72 = CurrentPoint.y - v68;
              v73 = v68 + v68;
              v100.origin.x = v71;
              v100.origin.y = v72;
              v100.size.width = v73;
              v100.size.height = v73;
              CGContextFillEllipseInRect(a3, v100);
              CGContextSetRGBStrokeColor(a3, 1.0, 1.0, 1.0, 1.0);
              v101.origin.x = v71;
              v101.origin.y = v72;
              v101.size.width = v73;
              v101.size.height = v73;
              CGContextStrokeEllipseInRect(a3, v101);
            }
          }
        }
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    }
    while (v55);
  }

  CGColorRelease(v52);
}

- (RCPEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStream, 0);
}

@end
