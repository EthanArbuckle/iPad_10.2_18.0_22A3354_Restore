void sub_1D4CAB0B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CAB170(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void PA::operator*(uint64_t a1, double *a2, __int128 *a3)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v17 = *a3;
  v18 = xmmword_1D4CCD100;
  v6 = PA::operator*(a2, (double *)&v17);
  v8 = v7;
  v17 = a3[1];
  v18 = xmmword_1D4CCD100;
  v9 = PA::operator*(a2, (double *)&v17);
  v11 = v10;
  v17 = a3[2];
  v18 = xmmword_1D4CCD100;
  v12 = PA::operator*(a2, (double *)&v17);
  v14 = v13;
  v17 = a3[3];
  v18 = xmmword_1D4CCD100;
  v15 = PA::operator*(a2, (double *)&v17);
  *(double *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v8;
  *(double *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v11;
  *(double *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v14;
  *(double *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v16;
}

{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v24 = *a3;
  v25 = *((_QWORD *)a3 + 2);
  v26 = 0x3FF0000000000000;
  v23 = PA::operator*(a2, (double *)&v24);
  v7 = v6;
  v9 = v8;
  v24 = *(__int128 *)((char *)a3 + 24);
  v25 = *((_QWORD *)a3 + 5);
  v26 = 0x3FF0000000000000;
  v10 = PA::operator*(a2, (double *)&v24);
  v12 = v11;
  v14 = v13;
  v24 = a3[3];
  v25 = *((_QWORD *)a3 + 8);
  v26 = 0x3FF0000000000000;
  v15 = PA::operator*(a2, (double *)&v24);
  v17 = v16;
  v19 = v18;
  v24 = *(__int128 *)((char *)a3 + 72);
  v25 = *((_QWORD *)a3 + 11);
  v26 = 0x3FF0000000000000;
  v20 = PA::operator*(a2, (double *)&v24);
  *(double *)a1 = v23;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v14;
  *(double *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v17;
  *(_QWORD *)(a1 + 64) = v19;
  *(double *)(a1 + 72) = v20;
  *(_QWORD *)(a1 + 80) = v21;
  *(_QWORD *)(a1 + 88) = v22;
}

double PA::Quad2d::boundingRect(float64x2_t *this)
{
  float64x2_t v1;
  float64x2_t v2;
  double result;

  v1 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[1], *this), *(int8x16_t *)this, (int8x16_t)this[1]);
  v2 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[2], v1), (int8x16_t)v1, (int8x16_t)this[2]);
  *(_QWORD *)&result = vbslq_s8((int8x16_t)vcgtq_f64(this[3], v2), (int8x16_t)v2, (int8x16_t)this[3]).u64[0];
  return result;
}

double PA::operator*(double *a1, double *a2)
{
  return a1[4] * a2[1] + *a1 * *a2 + a1[8] * a2[2] + a1[12] * a2[3];
}

void sub_1D4CAB3B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CAB594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CAB638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CAB6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t PFOppositeRectPoint(int a1)
{
  if ((a1 - 1) >= 9)
    return 0;
  else
    return (10 - a1);
}

uint64_t PFRectAreaToRectPoint(int a1)
{
  if ((a1 - 1) > 8)
    return 0;
  else
    return dword_1D4CCD308[a1 - 1];
}

uint64_t PFRectPointToRectArea(int a1)
{
  if ((a1 - 1) > 8)
    return 0;
  else
    return dword_1D4CCD32C[a1 - 1];
}

double PFRectPoint(int a1, double a2, double a3, double a4)
{
  double v4;
  double result;

  v4 = -a4;
  if (a4 >= 0.0)
  {
    v4 = a4;
    a4 = -0.0;
  }
  result = a2 + a4;
  switch(a1)
  {
    case 2:
      result = result + v4 * 0.5;
      break;
    case 3:
      result = v4 + result;
      break;
    case 5:
      result = result + v4 * 0.5;
      break;
    case 6:
      result = v4 + result;
      break;
    case 8:
      result = result + v4 * 0.5;
      break;
    case 9:
      result = v4 + result;
      break;
    default:
      return result;
  }
  return result;
}

double PFRectNormalize(double a1, double a2, double a3)
{
  if (a3 >= 0.0)
    a3 = -0.0;
  return a1 + a3;
}

double PFRectIntegralFloorRect(double a1)
{
  return floor(a1);
}

long double PFRectIntegralModRect(long double a1, long double a2, long double a3, long double a4, long double a5, long double a6)
{
  long double v11;

  v11 = a1 - fmod(a1, a5);
  fmod(a2, a6);
  fmod(a3, a5);
  fmod(a4, a6);
  return v11;
}

double PFRectIntegralContainedRect(double a1, double a2, double a3, double a4)
{
  double v5;
  double v6;

  v5 = COERCE_DOUBLE(NSIntegralRect(*(NSRect *)&a1));
  v6 = ceil(a1);
  if (v5 >= v6)
    return v5;
  return v6;
}

double PFRectAspectRatio(double a1, double a2, double a3, double a4)
{
  return a3 / a4;
}

double PFRectFromPoints(double a1, double a2, double a3)
{
  if (a1 >= a3)
    return a3;
  else
    return a1;
}

BOOL PFRectDifference(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  NSRect v9;

  v9 = NSIntersectionRect(*(NSRect *)&a1, *(NSRect *)&a5);
  return NSIsEmptyRect(v9);
}

CGFloat PFRectScaleToFit(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  NSRect v17;
  NSRect v18;

  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  if (!NSContainsRect(v17, v18))
    return PFRectScaleToFill2(0, a1, a2, a3, a4, a5, a6, a7, a8);
  return a1;
}

CGFloat PFRectScaleToFill2(double *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v17;
  NSRect v19;
  NSRect v20;

  v19.origin.x = a6;
  v19.origin.y = a7;
  v19.size.width = a8;
  v19.size.height = a9;
  if (NSIsEmptyRect(v19))
    return *MEMORY[0x1E0CB3438];
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  if (NSIsEmptyRect(v20))
    return a6;
  v17 = a8 / a4;
  if (a8 / a4 >= a9 / a5)
    v17 = a9 / a5;
  if (a1)
    *a1 = v17;
  return a2;
}

CGFloat PFRectScaleToFill(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return PFRectScaleToFill2(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

double PFRectCenteredScaleToContain(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v10;
  double v15;
  double v16;
  double v17;
  NSRect v19;
  NSRect v20;

  v10 = a5;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  if (NSIsEmptyRect(v19))
    return *MEMORY[0x1E0CB3438];
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  if (!NSIsEmptyRect(v20))
  {
    v15 = a7 / a3;
    if (a7 / a3 <= a8 / a4)
      v15 = a8 / a4;
    v16 = -a7;
    if (a7 < 0.0)
    {
      v17 = a7;
    }
    else
    {
      v16 = a7;
      v17 = -0.0;
    }
    return v10 + v17 + v16 * 0.5 - a3 * v15 * 0.5;
  }
  return v10;
}

double PFRectCenteredScaleToFit(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSRect v22;
  NSRect v23;

  v14 = -a7;
  if (a7 >= 0.0)
    v14 = a7;
  v15 = -0.0;
  if (a7 >= 0.0)
    v16 = -0.0;
  else
    v16 = a7;
  v17 = a5 + v16;
  v18 = -a8;
  if (a8 < 0.0)
    v15 = a8;
  else
    v18 = a8;
  v19 = v17 + v14 * 0.5 - a3 * 0.5;
  v20 = a6 + v15 + v18 * 0.5 - a4 * 0.5;
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  v23.origin.x = v19;
  v23.origin.y = v20;
  v23.size.width = a3;
  v23.size.height = a4;
  if (!NSContainsRect(v22, v23))
    return PFRectCenteredScaleToFill2(0, v19, v20, a3, a4, a5, a6, a7, a8);
  return v19;
}

double PFRectCenteredScaleToFill2(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v9 = -a4;
  if (a4 >= 0.0)
    v9 = a4;
  v10 = -0.0;
  if (a4 >= 0.0)
    v11 = -0.0;
  else
    v11 = a4;
  v12 = a2 + v11;
  v13 = -a5;
  if (a5 < 0.0)
  {
    v14 = a5;
  }
  else
  {
    v13 = a5;
    v14 = -0.0;
  }
  v15 = v12 + v9 * 0.5;
  v16 = a3 + v14 + v13 * 0.5;
  v17 = a4 * 0.5;
  v18 = a5 * 0.5;
  v19 = -a9;
  if (a9 >= 0.0)
  {
    v19 = a9;
    a9 = -0.0;
  }
  if (a8 < 0.0)
    v10 = a8;
  v20 = a6 + v10;
  v21 = a7 + a9;
  v22 = (v15 - v20) / v17;
  if (a8 < 0.0)
    a8 = -a8;
  v23 = (a8 + v20 - v15) / v17;
  v24 = (v19 + v21 - v16) / v18;
  v25 = (v16 - v21) / v18;
  if (v22 <= v23)
    v23 = v22;
  if (v23 > v24)
    v23 = v24;
  if (v23 > v25)
    v23 = v25;
  if (a1)
    *a1 = v23;
  return v15 - a4 * v23 * 0.5;
}

double PFRectCenteredScaleToFill(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  double v10;

  v8 = a7 / a3;
  if (a7 / a3 < a8 / a4)
    v8 = a8 / a4;
  v9 = a3 * v8;
  v10 = -a7;
  if (a7 >= 0.0)
  {
    v10 = a7;
    a7 = -0.0;
  }
  return a5 + a7 + v10 * 0.5 - v9 * 0.5;
}

double PFRectCenteredScaleToFillByCropping(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  double v10;

  v8 = a7 / a3;
  if (a7 / a3 >= a8 / a4)
    v8 = a8 / a4;
  v9 = a3 * v8;
  v10 = -a7;
  if (a7 >= 0.0)
  {
    v10 = a7;
    a7 = -0.0;
  }
  return a5 + a7 + v10 * 0.5 - v9 * 0.5;
}

double PFRectUniformCenteredScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;

  v5 = a3 * a5;
  v6 = -a3;
  if (a3 >= 0.0)
  {
    v6 = a3;
    a3 = -0.0;
  }
  return a1 + a3 + v6 * 0.5 - v5 * 0.5;
}

double PFRectCenteredScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;

  v5 = a3 * a5;
  v6 = -a3;
  if (a3 >= 0.0)
  {
    v6 = a3;
    a3 = -0.0;
  }
  return a1 + a3 + v6 * 0.5 - v5 * 0.5;
}

double PFRectAlignWithRect(int a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v14;

  v14 = PFRectPoint(a2, a7, a8, a9);
  return PFRectAlignToPoint(a1, a3, a4, a5, a6, v14);
}

double PFRectAlignToPoint(int a1, double a2, double a3, double a4, double a5, double a6)
{
  switch(a1)
  {
    case 1:
    case 4:
    case 7:
      return a6;
    case 2:
      a6 = a6 + a4 * -0.5;
      break;
    case 3:
      a6 = a6 - a4;
      break;
    case 5:
      a6 = a6 - a4 * 0.5;
      break;
    case 6:
      a6 = a6 - a4;
      break;
    case 8:
      a6 = a6 + a4 * -0.5;
      break;
    case 9:
      a6 = a6 - a4;
      break;
    default:
      a6 = a2;
      break;
  }
  return a6;
}

double PFRectScaleByCGAffineTransform(double *a1, double a2, double a3)
{
  return a1[4] + a3 * a1[2] + *a1 * a2;
}

double PFRectMapPoint(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  if (a5 != 0.0 && a6 != 0.0)
    return a9 + (result - a3) / a5 * a11;
  return result;
}

double PFRectMapPoint2(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v18;

  if (a5 != 0.0 && a6 != 0.0)
  {
    v18 = (result - a3) / a5;
    if (a5 > a6 != a11 > a12)
      return a10 + (a2 - a4) / a6 * a11;
    else
      return a9 + v18 * a11;
  }
  return result;
}

BOOL PFRectIsLandscape(double a1, double a2, double a3, double a4)
{
  return a3 > a4;
}

double PFRectMapRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v19;
  double result;

  if (a3 >= 0.0)
    v19 = -0.0;
  else
    v19 = a3;
  result = a1 + v19;
  if (a7 != 0.0 && a8 != 0.0)
    return a9 + (result - a5) / a7 * a11;
  return result;
}

double PFRectMapRect2(int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  double v20;
  double v21;
  double result;
  double v23;

  v20 = -0.0;
  if (a4 >= 0.0)
    v21 = -0.0;
  else
    v21 = a4;
  result = a2 + v21;
  if (a5 < 0.0)
    v20 = a5;
  v23 = a3 + v20;
  if (a1)
  {
    if (a8 != 0.0 && a9 != 0.0)
      return a10 + (result - a6) / a8 * a12;
  }
  else if (a8 != 0.0 && a9 != 0.0)
  {
    if (a8 > a9 != a12 > a13)
      return a11 + (v23 - a7) / a9 * a12;
    else
      return a10 + (result - a6) / a8 * a12;
  }
  return result;
}

double PFRectContainRect(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v9;

  if (a3 <= a7 && a4 <= a8)
  {
    if (result < a5)
      result = a5;
    v9 = a5 + a7;
    if (a3 + result > v9)
      return v9 - a3;
  }
  return result;
}

BOOL PFRectCouldContainRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a4 <= a8 && a3 <= a7;
}

double PFRectGrowToContainRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 < a5)
    return a1;
  return a5;
}

double PFRectGrowAtHit(int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL4 v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;

  switch(a1)
  {
    case 1:
      v8 = 0;
      v9 = a2 + a4 - a6;
      v10 = a7 - a3;
      goto LABEL_20;
    case 2:
      v10 = a7 - a3;
      v8 = a5 > a7 - a3;
      goto LABEL_5;
    case 3:
      v8 = 0;
      v9 = a6 - a2;
      v10 = a7 - a3;
      goto LABEL_19;
    case 4:
      v9 = a2 + a4 - a6;
      v8 = a4 > v9;
      v10 = a5;
      goto LABEL_20;
    case 5:
      v9 = a4 + a6;
      v10 = a5 + a7;
      v11 = a6 < 0.0;
      a6 = a2 - a6 * 0.5;
      v8 = v11;
      if (a7 < 0.0)
        v8 = 1;
      goto LABEL_20;
    case 6:
      v9 = a6 - a2;
      v8 = a4 > a6 - a2;
      v10 = a5;
      goto LABEL_19;
    case 7:
      v8 = 0;
      v9 = a2 + a4 - a6;
      v10 = a3 + a5 - a7;
      goto LABEL_20;
    case 8:
      v10 = a3 + a5 - a7;
      v8 = a5 > v10;
      v9 = a4;
      goto LABEL_19;
    case 9:
      v8 = 0;
      v9 = a6 - a2;
      v10 = a3 + a5 - a7;
      goto LABEL_19;
    default:
      v8 = 0;
      v10 = a5;
LABEL_5:
      v9 = a4;
LABEL_19:
      a6 = a2;
LABEL_20:
      if (a8 > 0.0)
      {
        v12 = fabs(v9);
        if (v10 < 0.0)
          v12 = -v12;
        v13 = floor(v12 / a8);
        v14 = fabs(v10);
        if (v9 < 0.0)
          v14 = -v14;
        v15 = floor(v14 * a8);
        if (fabs(v9 * v13) <= fabs(v10 * v15))
          v16 = v15;
        else
          v16 = v9;
        switch(a1)
        {
          case 1:
            a6 = a2 + a4 - v16;
            break;
          case 2:
          case 8:
            if (v8)
              v16 = v15;
            a6 = a6 + (a4 - v16) * 0.5;
            break;
          case 5:
            if (v8)
              v16 = v15;
            v18 = -a4;
            if (a4 >= 0.0)
            {
              v18 = a4;
              a4 = -0.0;
            }
            a6 = a2 + a4 + v18 * 0.5 - v16 * 0.5;
            break;
          case 7:
            a6 = a2 + a4 - v16;
            break;
          default:
            return a6;
        }
      }
      return a6;
  }
}

double PFRectContainPoint(double result, double a2, double a3, double a4, double a5)
{
  double v5;

  if (result < a3)
    result = a3;
  v5 = a3 + a5;
  if (result > v5)
    return v5;
  return result;
}

double PFRectClampRect(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5)
    return a5;
  return result;
}

BOOL PFRectIsInside(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 >= a5 && a1 + a3 <= a5 + a7 && a2 >= a6 && a2 + a4 <= a6 + a8;
}

double PFRectInterpolate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v14;
  double v15;

  v14 = 1.0;
  if (a9 <= 1.0)
    v14 = a9;
  if (a9 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  return a1 - (a1 - a5) * v15;
}

double PFRectEaseInterpolate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v26;

  v26 = (sin(a9 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
  return PFRectInterpolate(a1, a2, a3, a4, a5, a6, a7, a8, v26);
}

double PFRectEaseInterpolateBend(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v22;
  BOOL v23;
  double v24;
  double v25;
  long double v26;
  double result;
  CGFloat dY;
  NSRect v33;

  v22 = sin(a9 * 3.14159265) * a10;
  v23 = floor(a1 + a3 * 0.5) == floor(a5 + a7 * 0.5);
  if (v23)
    v24 = 0.0;
  else
    v24 = v22;
  dY = v24;
  if (v23)
    v25 = v22;
  else
    v25 = 0.0;
  v26 = sin(a9 * 3.14159265 + -1.57079633);
  v33.origin.x = PFRectInterpolate(a1, a2, a3, a4, a5, a6, a7, a8, (v26 + 1.0) * 0.5);
  *(_QWORD *)&result = (unint64_t)NSOffsetRect(v33, v25, dY);
  return result;
}

uint64_t PFRectClosestPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  NSPoint v19;
  NSRect v20;

  v13 = a3 * 0.5;
  v14 = a4 * 0.5;
  v15 = 1;
  while (1)
  {
    v20.origin.x = PFRectPoint(v15, a5, a6, a7) - v13;
    v20.origin.y = v16 - v14;
    v19.x = a1;
    v19.y = a2;
    v20.size.width = a3;
    v20.size.height = a4;
    if (NSPointInRect(v19, v20))
      break;
    v15 = (v15 + 1);
    if ((_DWORD)v15 == 10)
      return 0;
  }
  return v15;
}

uint64_t PFRectClosestSide(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v9;

  v6 = a6 * a3;
  v7 = a1 - a4;
  if (a1 - a4 < 0.0)
    v7 = -(a1 - a4);
  if (v7 < v6)
    return 1;
  v9 = a1 - (a4 + a6);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= v6)
    return 0;
  else
    return 2;
}

uint64_t PFRectClosestArea(int a1, CGFloat a2, CGFloat a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  NSPoint v26;
  NSRect v27;

  v16 = 1;
  while (1)
  {
    PFRectBoundsForAreaType(a4, a5, a6, a7, a8, v16, a1);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26.x = a2;
    v26.y = a3;
    v27.origin.x = v18;
    v27.origin.y = v20;
    v27.size.width = v22;
    v27.size.height = v24;
    if (NSPointInRect(v26, v27))
      break;
    v16 = (v16 + 1);
    if ((_DWORD)v16 == 10)
      return 0;
  }
  return v16;
}

void PFRectBoundsForAreaType(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, int a7)
{
  double v13;
  NSRect v14;

  v13 = a1;
  if ((a7 & 1) == 0)
    v13 = a1 - floor(a1 / 3.0);
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  NSInsetRect(v14, v13, v13);
  PFRectBoundsForAreas(a7, a1, a2, a3, a4, a5);
}

double PFRectBoundsForAreas(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v7;
  CGFloat v8;
  NSRect v10;

  v7 = a3;
  if (!a1)
  {
    v8 = -(a2 - (a2 - floor(a2 / 3.0)));
    v10.origin.x = a3;
    v10.origin.y = a4;
    v10.size.width = a5;
    v10.size.height = a6;
    *(_QWORD *)&v7 = (unint64_t)NSInsetRect(v10, v8, v8);
  }
  return v7;
}

double PFRectVector(int a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v13;

  v13 = PFRectPoint(a1, a3, a4, a5);
  return PFRectPoint(a2, a7, a8, a9) - v13;
}

uint64_t PFRectIntersectLine(double *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v33;
  double v34;
  double v35;
  NSPoint v38;
  NSPoint v39;
  NSPoint v40;
  NSPoint v41;

  v13 = a8 - a6;
  v14 = a9 - a7;
  if (a8 - a6 == 0.0)
  {
    v15 = 1.79769313e308;
    v16 = 1.79769313e308;
  }
  else
  {
    v15 = (a2 - a6) / v13;
    v16 = (a2 + a4 - a6) / v13;
  }
  v17 = (a3 + a5 - a7) / v14;
  v18 = (a3 - a7) / v14;
  if (v14 == 0.0)
  {
    v17 = 1.79769313e308;
    v18 = 1.79769313e308;
  }
  v19 = -(a4 * v13);
  v20 = v15 > 0.0 && v19 < 0.0;
  v21 = fmin(v15, 1.0);
  if (!v20)
    v15 = 0.0;
  if (v19 >= 0.0)
    v22 = v21;
  else
    v22 = 1.0;
  v23 = a4 * v13;
  if (v16 >= v22)
    v24 = v22;
  else
    v24 = v16;
  if (v16 <= v15 || v23 >= 0.0)
    v16 = v15;
  if (v23 >= 0.0)
    v26 = v24;
  else
    v26 = v22;
  v27 = v14 * a5;
  if (v17 >= v26)
    v28 = v26;
  else
    v28 = v17;
  if (v17 > v16 && v27 < 0.0)
    v16 = v17;
  if (v27 >= 0.0)
    v26 = v28;
  v30 = -(a5 * v14);
  if (v18 >= v26)
    v31 = v26;
  else
    v31 = v18;
  if (v18 > v16 && v30 < 0.0)
    v16 = v18;
  if (v30 >= 0.0)
    v33 = v31;
  else
    v33 = v26;
  if (v16 >= v33)
    return 0;
  v34 = a6 + v13 * v16;
  v35 = a7 + v14 * v16;
  v38.x = a6;
  v38.y = a7;
  v40.x = v34;
  v40.y = v35;
  if (NSEqualPoints(v38, v40))
  {
    v34 = a6 + v13 * v33;
    v35 = a7 + v14 * v33;
    v39.x = a8;
    v39.y = a9;
    v41.x = v34;
    v41.y = v35;
    if (NSEqualPoints(v39, v41))
      return 0;
  }
  if (a1)
  {
    *a1 = v34;
    a1[1] = v35;
  }
  return 1;
}

BOOL PFRectEdgeInRange(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;

  if (a3 <= a4)
    v6 = a4;
  else
    v6 = a3;
  return v6 <= a6 && v6 >= a5;
}

BOOL PFRectEdgeIntersectsRect(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v14;
  double v15;

  if ((*(_DWORD *)a1 & 0xFFFFFFFD) != 1)
  {
    v10 = *(double *)(a1 + 16);
    v11 = a3 + a5;
    if (v10 >= a3 && v10 <= v11)
    {
      v14 = *(double *)(a1 + 8);
      if (v14 >= a2 || *(double *)(a1 + 24) >= a2)
      {
        v15 = a2 + a4;
        if (v14 <= v15 || *(double *)(a1 + 24) <= v15)
          return 1;
      }
    }
    return 0;
  }
  v5 = *(double *)(a1 + 8);
  v6 = a2 + a4;
  if (v5 < a2 || v5 > v6)
    return 0;
  v8 = *(double *)(a1 + 16);
  if (v8 < a3 && *(double *)(a1 + 32) < a3)
    return 0;
  v9 = a3 + a5;
  return v8 <= v9 || *(double *)(a1 + 32) <= v9;
}

uint64_t PFRectMakeBoundingRect(uint64_t result)
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v1 = 0;
  v2 = 1.79769313e308;
  v3 = -1.79769313e308;
  v4 = -1.79769313e308;
  v5 = 1.79769313e308;
  do
  {
    v6 = *(double *)(result + v1);
    v7 = *(double *)(result + v1 + 8);
    if (v6 < v5)
      v5 = *(double *)(result + v1);
    if (v6 > v4)
      v4 = *(double *)(result + v1);
    if (v7 < v2)
      v2 = *(double *)(result + v1 + 8);
    if (v7 > v3)
      v3 = *(double *)(result + v1 + 8);
    v1 += 16;
  }
  while (v1 != 64);
  return result;
}

id PFRectRotateByDegrees(double a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -a3;
  if (a3 >= 0.0)
    v14 = a3;
  v15 = -0.0;
  if (a3 >= 0.0)
    v16 = -0.0;
  else
    v16 = a3;
  v17 = a1 + v16;
  v18 = -a4;
  if (a4 < 0.0)
    v15 = a4;
  else
    v18 = a4;
  v19 = v17 + v14 * 0.5;
  v20 = a2 + v15 + v18 * 0.5;
  objc_msgSend(v10, "translateXBy:yBy:", -v19, -v20);
  objc_msgSend(v13, "appendTransform:", v10);
  objc_msgSend(v12, "rotateByDegrees:", a5);
  objc_msgSend(v13, "appendTransform:", v12);
  objc_msgSend(v11, "translateXBy:yBy:", v19, v20);
  objc_msgSend(v13, "appendTransform:", v11);

  return v13;
}

id PFRectScaleAroundCenter(double a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -a3;
  if (a3 >= 0.0)
    v16 = a3;
  v17 = -0.0;
  if (a3 >= 0.0)
    v18 = -0.0;
  else
    v18 = a3;
  v19 = a1 + v18;
  v20 = -a4;
  if (a4 < 0.0)
    v17 = a4;
  else
    v20 = a4;
  v21 = v19 + v16 * 0.5;
  v22 = a2 + v17 + v20 * 0.5;
  objc_msgSend(v12, "translateXBy:yBy:", -v21, -v22);
  objc_msgSend(v15, "appendTransform:", v12);
  objc_msgSend(v14, "scaleXBy:yBy:", a5, a6);
  objc_msgSend(v15, "appendTransform:", v14);
  objc_msgSend(v13, "translateXBy:yBy:", v21, v22);
  objc_msgSend(v15, "appendTransform:", v13);

  return v15;
}

float64x2_t PFRectGetTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, float64x2_t a4@<Q2>, float64_t a5@<D3>, float64x2_t a6@<Q4>, float64_t a7@<D5>, float64x2_t a8@<Q6>, float64_t a9@<D7>)
{
  int8x16_t v9;
  int8x16_t v10;
  float64x2_t result;
  int8x16_t v12;
  float64x2_t v13;
  float64x2_t v14;

  a4.f64[1] = a5;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v9 = (int8x16_t)vcltzq_f64(a4);
  v10 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  a2.f64[1] = a3;
  result = vaddq_f64(a2, (float64x2_t)vbslq_s8(v9, (int8x16_t)a4, v10));
  a8.f64[1] = a9;
  v12 = (int8x16_t)vcltzq_f64(a8);
  a6.f64[1] = a7;
  v13 = vaddq_f64(a6, (float64x2_t)vbslq_s8(v12, (int8x16_t)a8, v10));
  v14 = vdivq_f64(vsubq_f64(vaddq_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)vnegq_f64(a8), (int8x16_t)a8), v13), v13), vsubq_f64(vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)vnegq_f64(a4), (int8x16_t)a4), result), result));
  *(float64_t *)a1 = v14.f64[0];
  *(float64_t *)(a1 + 24) = v14.f64[1];
  *(float64x2_t *)(a1 + 32) = vmlsq_f64(v13, result, v14);
  return result;
}

id PFRectGetNSAffineTransform(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -a3;
  v20 = -0.0;
  if (a3 >= 0.0)
    v21 = -0.0;
  else
    v21 = a3;
  v22 = a1 + v21;
  v23 = -a4;
  if (a3 >= 0.0)
    v19 = a3;
  if (a4 >= 0.0)
    v24 = -0.0;
  else
    v24 = a4;
  v25 = a2 + v24;
  v26 = -a7;
  if (a4 >= 0.0)
    v23 = a4;
  if (a7 >= 0.0)
    v27 = -0.0;
  else
    v27 = a7;
  v28 = a5 + v27;
  if (a7 >= 0.0)
    v26 = a7;
  if (a8 < 0.0)
    v20 = a8;
  v29 = a6 + v20;
  v30 = v19 + v22;
  v31 = v23 + v25;
  if (a8 >= 0.0)
    v32 = a8;
  else
    v32 = -a8;
  v33 = v28 - (v26 + v28 - v28) / (v30 - v22) * v22;
  v34 = v29 - (v32 + v29 - v29) / (v31 - v25) * v25;
  objc_msgSend(v17, "scaleXBy:yBy:");
  objc_msgSend(v18, "appendTransform:", v17);
  objc_msgSend(v16, "translateXBy:yBy:", v33, v34);
  objc_msgSend(v18, "appendTransform:", v16);

  return v18;
}

double PFRectPixelAlignedRect(double a1)
{
  return ceil(a1) + 0.5;
}

uint64_t *PFAspectRatioToWholeLengths(uint64_t *result, uint64_t *a2, double a3)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a3 <= 0.0)
  {
    if (a3 >= 0.0)
    {
      v5 = 0;
      v6 = 0;
      if (!result)
        goto LABEL_22;
      goto LABEL_21;
    }
    v7 = 1.0 / a3;
    if (v7 < 0.0)
      v7 = -v7;
    v8 = v7 * 100.0;
  }
  else
  {
    if (a3 < 1.0)
      v3 = 1.0 / a3;
    else
      v3 = a3;
    v4 = -(v3 + -1.0);
    if (v3 + -1.0 >= 0.0)
      v4 = v3 + -1.0;
    if (v4 < 0.01)
    {
      v5 = 1;
      v6 = 1;
      if (!result)
        goto LABEL_22;
LABEL_21:
      *result = v6;
      goto LABEL_22;
    }
    v9 = v3 + -1.3333;
    if (v3 + -1.3333 < 0.0)
      v9 = -(v3 + -1.3333);
    if (v9 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 3;
      v11 = 4;
      goto LABEL_45;
    }
    v12 = v3 + -1.25;
    if (v3 + -1.25 < 0.0)
      v12 = -(v3 + -1.25);
    if (v12 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 4;
      v11 = 5;
      goto LABEL_45;
    }
    v13 = v3 + -1.4;
    if (v3 + -1.4 < 0.0)
      v13 = -(v3 + -1.4);
    if (v13 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 5;
      v11 = 7;
      goto LABEL_45;
    }
    v14 = v3 + -1.5;
    if (v3 + -1.5 < 0.0)
      v14 = -(v3 + -1.5);
    if (v14 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 2;
      v11 = 3;
      goto LABEL_45;
    }
    v15 = v3 + -1.7777;
    if (v3 + -1.7777 < 0.0)
      v15 = -(v3 + -1.7777);
    if (v15 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 9;
      v11 = 16;
      goto LABEL_45;
    }
    v16 = v3 + -1.375;
    if (v16 < 0.0)
      v16 = -v16;
    if (v16 < 0.01)
    {
      v10 = a3 < 1.0;
      v5 = 8;
      v11 = 11;
LABEL_45:
      if (v10)
        v6 = v5;
      else
        v6 = v11;
      if (v10)
        v5 = v11;
      if (result)
        goto LABEL_21;
      goto LABEL_22;
    }
    v8 = 1.0 / a3 * 100.0;
  }
  v5 = (uint64_t)v8;
  v6 = 100;
  if (result)
    goto LABEL_21;
LABEL_22:
  if (a2)
    *a2 = v5;
  return result;
}

double PFConstrainPointToRect(double a1, double a2, double a3, double a4, double a5)
{
  double v5;

  if (a1 >= a3)
  {
    v5 = a3 + a5;
    a3 = a1;
    if (a1 > v5)
      return v5;
  }
  return a3;
}

uint64_t NSStringFromPFIntRect(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%lu, %lu}}]"), *a1, a1[1], a1[2], a1[3]);
}

void sub_1D4CAEAC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error json-ifying data %@"));
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1D4CAEA78);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4CB09A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CB0A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float64_t PA::Quad2d::areaCenter(float64x2_t *this)
{
  float64x2_t *v2;
  float64x2_t v3;
  float64x2_t *v4;
  float64x2_t v5;
  float64x2_t v11;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  _OWORD v21[2];
  int v22;
  _OWORD v23[2];
  int v24;
  float64x2_t v25;
  float64x2_t v26;
  int v27;
  float64x2_t v28;
  float64x2_t v29;
  int v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = this + 2;
  v3 = this[2];
  v4 = this + 1;
  v5 = this[1];
  __asm { FMOV            V3.2D, #0.5 }
  v28 = *this;
  v29 = vaddq_f64(v5, vmulq_f64(vsubq_f64(v3, v5), _Q3));
  v15 = v5;
  v16 = v29;
  v30 = 0;
  v18 = v3;
  v20 = _Q3;
  v13 = *this;
  v11 = vaddq_f64(*this, vmulq_f64(vsubq_f64(v3, *this), _Q3));
  v25 = this[1];
  v26 = v11;
  v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v32) != 2)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  v28 = this[3];
  v29 = v16;
  v30 = 0;
  v17 = this[3];
  v25 = *v4;
  v26 = vaddq_f64(v18, vmulq_f64(vsubq_f64(v17, v18), v20));
  v19 = v26;
  v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v33) != 2)
  {
LABEL_8:
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  v28 = *v4;
  v29 = vaddq_f64(v13, vmulq_f64(vsubq_f64(v17, v13), v20));
  v14 = v29;
  v30 = 0;
  v25 = *this;
  v26 = vaddq_f64(v15, vmulq_f64(vsubq_f64(v17, v15), v20));
  v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v34) != 2)
  {
LABEL_9:
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  v28 = *v2;
  v29 = v14;
  v30 = 0;
  v25 = *this;
  v26 = v19;
  v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v35) != 2)
  {
LABEL_10:
    _PFAssertFailHandler();
LABEL_11:
    _PFAssertFailHandler();
  }
  v23[0] = v32;
  v23[1] = v33;
  v24 = 0;
  v21[0] = v34;
  v21[1] = v35;
  v22 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)v23, (uint64_t)v21, &v31) != 2)
    goto LABEL_11;
  return v31.f64[0];
}

__int128 *PA::Matrix4d::rotateAxis(__int128 *a1, uint64_t a2, double a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __double2 v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v21[11];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v4 = a1[5];
  v29 = a1[4];
  v30 = v4;
  v5 = a1[7];
  v31 = a1[6];
  v32 = v5;
  v6 = a1[1];
  v25 = *a1;
  v26 = v6;
  v7 = a1[3];
  v27 = a1[2];
  v28 = v7;
  *(_QWORD *)&v7 = *(_QWORD *)(a2 + 8);
  v8 = *(double *)(a2 + 16);
  v9 = sqrt(*(double *)&v7 * *(double *)&v7 + *(double *)a2 * *(double *)a2 + v8 * v8);
  v10 = *(double *)a2 / v9;
  v11 = *(double *)&v7 / v9;
  v12 = v8 / v9;
  v13 = __sincos_stret(a3);
  v14 = v10 * (1.0 - v13.__cosval);
  v15 = v11 * (1.0 - v13.__cosval);
  v21[0] = v13.__cosval + v14 * v10;
  v21[1] = v12 * v13.__sinval + v14 * v11;
  v21[2] = -(v11 * v13.__sinval - v14 * v12);
  v21[3] = 0.0;
  v21[4] = -(v12 * v13.__sinval - v14 * v11);
  v21[5] = v13.__cosval + v15 * v11;
  v21[6] = v10 * v13.__sinval + v15 * v12;
  v21[7] = 0.0;
  v21[8] = v11 * v13.__sinval + v14 * v12;
  v21[9] = -(v10 * v13.__sinval - v15 * v12);
  v21[10] = v13.__cosval + v12 * (1.0 - v13.__cosval) * v12;
  v22 = 0u;
  v23 = 0u;
  v24 = 0x3FF0000000000000;
  PA::Matrix4d::operator*=((double *)&v25, v21);
  v16 = v30;
  a1[4] = v29;
  a1[5] = v16;
  v17 = v32;
  a1[6] = v31;
  a1[7] = v17;
  v18 = v26;
  *a1 = v25;
  a1[1] = v18;
  v19 = v28;
  a1[2] = v27;
  a1[3] = v19;
  return a1;
}

double PA::Matrix4d::operator*=(double *a1, double *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double result;

  v3 = *a1;
  v2 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v7 = a1[4];
  v6 = a1[5];
  v9 = a1[6];
  v8 = a1[7];
  v11 = a1[8];
  v10 = a1[9];
  v13 = a1[10];
  v12 = a1[11];
  v15 = a1[12];
  v14 = a1[13];
  *a1 = v7 * a2[1] + *a1 * *a2 + v11 * a2[2] + v15 * a2[3];
  a1[4] = v7 * a2[5] + v3 * a2[4] + v11 * a2[6] + v15 * a2[7];
  v17 = a1[14];
  v16 = a1[15];
  a1[8] = v7 * a2[9] + v3 * a2[8] + v11 * a2[10] + v15 * a2[11];
  a1[12] = v7 * a2[13] + v3 * a2[12] + v11 * a2[14] + v15 * a2[15];
  a1[1] = v6 * a2[1] + v2 * *a2 + v10 * a2[2] + v14 * a2[3];
  a1[5] = v6 * a2[5] + v2 * a2[4] + v10 * a2[6] + v14 * a2[7];
  a1[9] = v6 * a2[9] + v2 * a2[8] + v10 * a2[10] + v14 * a2[11];
  a1[13] = v6 * a2[13] + v2 * a2[12] + v10 * a2[14] + v14 * a2[15];
  a1[2] = v9 * a2[1] + v5 * *a2 + v13 * a2[2] + v17 * a2[3];
  a1[6] = v9 * a2[5] + v5 * a2[4] + v13 * a2[6] + v17 * a2[7];
  a1[10] = v9 * a2[9] + v5 * a2[8] + v13 * a2[10] + v17 * a2[11];
  a1[14] = v9 * a2[13] + v5 * a2[12] + v13 * a2[14] + v17 * a2[15];
  a1[3] = v8 * a2[1] + v4 * *a2 + v12 * a2[2] + v16 * a2[3];
  a1[7] = v8 * a2[5] + v4 * a2[4] + v12 * a2[6] + v16 * a2[7];
  a1[11] = v8 * a2[9] + v4 * a2[8] + v12 * a2[10] + v16 * a2[11];
  result = v8 * a2[13] + v4 * a2[12] + v12 * a2[14] + v16 * a2[15];
  a1[15] = result;
  return result;
}

uint64_t PA::LineSegment2d::findIntersectPoint(uint64_t a1, uint64_t a2, float64x2_t *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  v3 = *(double *)(a1 + 8);
  v4 = *(double *)(a1 + 16) - *(double *)a1;
  v5 = *(double *)(a1 + 24) - v3;
  v6 = *(double *)(a2 + 16);
  v7 = *(double *)(a2 + 24);
  v8 = *(double *)(a2 + 8);
  v9 = v6 - *(double *)a2;
  v10 = v7 - v8;
  v11 = *(double *)a2 - *(double *)a1;
  v12 = v8 - v3;
  v13 = v11 * v10 - v12 * v9;
  v14 = v4 * v10 - v5 * v9;
  if (v14 == 0.0)
  {
    if (v13 == 0.0)
    {
      if (*(_DWORD *)(a1 + 32) | *(_DWORD *)(a2 + 32))
      {
        return 4;
      }
      else
      {
        v15 = v4 == 0.0;
        v16 = v12 / v5;
        v17 = (v7 - v3) / v5;
        v18 = v6 - *(double *)a1;
        if (v4 == 0.0)
          v19 = v16;
        else
          v19 = v11 / v4;
        v20 = v18 / v4;
        if (v15)
          v20 = v17;
        v21 = 3;
        if (v19 <= 1.0 || v20 <= 1.0)
        {
          if (v20 < 0.0 && v19 < 0.0)
            return 3;
          else
            return 4;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v24 = (v4 * v12 - v11 * v5) / (v9 * v5 - v10 * v4);
    v25 = v13 / v14 < 0.0;
    if (v13 / v14 > 1.0)
      v25 = 1;
    v26 = *(_DWORD *)(a1 + 32) != 1 && v25;
    v27 = v24 <= 1.0 && v24 >= 0.0;
    v21 = 1;
    if (!v26 && (*(_DWORD *)(a2 + 32) == 1 || v27))
    {
      if (a3)
        *a3 = vaddq_f64(*(float64x2_t *)a1, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)a1), v13 / v14));
      return 2;
    }
  }
  return v21;
}

void sub_1D4CB1204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IPAScaledTimeFromNaturalTime(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>, unsigned int a5@<S0>)
{
  Float64 Seconds;
  __int128 v11;
  void *v12;
  Float64 v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CMTime time2;

  *(_OWORD *)a4 = *a1;
  *(_QWORD *)(a4 + 16) = *((_QWORD *)a1 + 2);
  if ((*((_BYTE *)a3 + 12) & 1) == 0
    || (*((_BYTE *)a3 + 36) & 1) == 0
    || *((_QWORD *)a3 + 5)
    || (*((_QWORD *)a3 + 3) & 0x8000000000000000) != 0
    || (v15 = *(__int128 *)((char *)a3 + 24),
        *(_QWORD *)&v16 = *((_QWORD *)a3 + 5),
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
        CMTimeCompare((CMTime *)&v15, &time2)))
  {
    v15 = *a2;
    *(_QWORD *)&v16 = *((_QWORD *)a2 + 2);
    Seconds = CMTimeGetSeconds((CMTime *)&v15);
    v11 = a3[1];
    v15 = *a3;
    v16 = v11;
    v17 = a3[2];
    objc_msgSend(MEMORY[0x1E0D75298], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v15, 0, Seconds, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), a5)));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v15 = *a1;
      *(_QWORD *)&v16 = *((_QWORD *)a1 + 2);
      v13 = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&v13 = v13;
      objc_msgSend(v12, "scaledTimeForOriginalTime:", v13);
      CMTimeMakeWithSeconds((CMTime *)&v15, v14, 90000);
      *(_OWORD *)a4 = v15;
      *(_QWORD *)(a4 + 16) = v16;
    }

  }
}

void IPANaturalTimeFromScaledTime(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>, unsigned int a5@<S0>)
{
  Float64 Seconds;
  __int128 v11;
  void *v12;
  Float64 v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CMTime time2;

  *(_OWORD *)a4 = *a1;
  *(_QWORD *)(a4 + 16) = *((_QWORD *)a1 + 2);
  if ((*((_BYTE *)a3 + 12) & 1) == 0
    || (*((_BYTE *)a3 + 36) & 1) == 0
    || *((_QWORD *)a3 + 5)
    || (*((_QWORD *)a3 + 3) & 0x8000000000000000) != 0
    || (v15 = *(__int128 *)((char *)a3 + 24),
        *(_QWORD *)&v16 = *((_QWORD *)a3 + 5),
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
        CMTimeCompare((CMTime *)&v15, &time2)))
  {
    v15 = *a2;
    *(_QWORD *)&v16 = *((_QWORD *)a2 + 2);
    Seconds = CMTimeGetSeconds((CMTime *)&v15);
    v11 = a3[1];
    v15 = *a3;
    v16 = v11;
    v17 = a3[2];
    objc_msgSend(MEMORY[0x1E0D75298], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v15, 0, Seconds, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), a5)));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v15 = *a1;
      *(_QWORD *)&v16 = *((_QWORD *)a1 + 2);
      v13 = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&v13 = v13;
      objc_msgSend(v12, "originalTimeForScaledTime:", v13);
      CMTimeMakeWithSeconds((CMTime *)&v15, v14, 90000);
      *(_OWORD *)a4 = v15;
      *(_QWORD *)(a4 + 16) = v16;
    }

  }
}

__n128 IPAClipTime@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  __n128 result;
  CMTime v8;
  CMTimeRange range;
  CMTime v10;

  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(a1 + 16);
  memset(&v10, 0, sizeof(v10));
  v6 = a2[1];
  *(_OWORD *)&range.start.value = *a2;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = a2[2];
  CMTimeRangeGetEnd(&v10, &range);
  *(_OWORD *)&range.start.value = *(_OWORD *)a1;
  range.start.epoch = *(_QWORD *)(a1 + 16);
  v8 = *(CMTime *)a2;
  if (CMTimeCompare(&range.start, &v8) < 0)
  {
    result = *(__n128 *)a2;
    *(_OWORD *)a3 = *a2;
    *(_QWORD *)(a3 + 16) = *((_QWORD *)a2 + 2);
  }
  else
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)a1;
    range.start.epoch = *(_QWORD *)(a1 + 16);
    v8 = v10;
    if (CMTimeCompare(&range.start, &v8) >= 1)
    {
      result.n128_u64[0] = v10.value;
      *(CMTime *)a3 = v10;
      if (*(_DWORD *)(a3 + 8) != 1)
        --*(_QWORD *)a3;
    }
  }
  return result;
}

double IPAClipTimeRange@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  CMTime *v6;
  __int128 v7;
  __int128 v8;
  CMTimeValue value;
  __int128 v10;
  __int128 v11;
  double result;
  CMTime v13;
  CMTime start;
  CMTime v15;
  CMTimeRange time1;
  CMTime v17;
  __int128 v18;
  CMTime time2;

  *(_OWORD *)&time1.start.value = *(_OWORD *)a1;
  time1.start.epoch = *(_QWORD *)(a1 + 16);
  time2 = *(CMTime *)a2;
  if (CMTimeCompare(&time1.start, &time2) >= 0)
    v6 = (CMTime *)a1;
  else
    v6 = (CMTime *)a2;
  time2 = *v6;
  memset(&v17, 0, sizeof(v17));
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&time1.start.value = *(_OWORD *)a2;
  *(_OWORD *)&time1.start.epoch = v7;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a2 + 32);
  CMTimeRangeGetEnd(&v17, &time1);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&time1.start.value = *(_OWORD *)a1;
  *(_OWORD *)&time1.start.epoch = v8;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a1 + 32);
  CMTimeRangeGetEnd(&v15, &time1);
  time1.start = v17;
  if (CMTimeCompare(&v15, &time1.start) < 1)
  {
    v10 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&time1.start.value = *(_OWORD *)a1;
    *(_OWORD *)&time1.start.epoch = v10;
    *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a1 + 32);
    CMTimeRangeGetEnd(&start, &time1);
    value = start.value;
    v18 = *(_OWORD *)&start.timescale;
  }
  else
  {
    v18 = *(_OWORD *)&v17.timescale;
    value = v17.value - 1;
  }
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  time1.start = time2;
  start.value = value;
  *(_OWORD *)&start.timescale = v18;
  if (CMTimeCompare(&time1.start, &start) < 0)
  {
    start = time2;
    v13.value = value;
    *(_OWORD *)&v13.timescale = v18;
    CMTimeRangeFromTimeToTime(&time1, &start, &v13);
  }
  else
  {
    start = time2;
    v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&time1, &start, &v13);
  }
  v11 = *(_OWORD *)&time1.start.epoch;
  *a3 = *(_OWORD *)&time1.start.value;
  a3[1] = v11;
  result = *(double *)&time1.duration.timescale;
  a3[2] = *(_OWORD *)&time1.duration.timescale;
  return result;
}

CMTime *IPAMapNormalizedTime@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v6;
  int v7;
  __int128 v8;
  CMTimeFlags v9;
  CMTimeEpoch v10;
  double Seconds;
  __int128 v12;
  __int128 v14;
  uint64_t v15;
  CMTimeRange toRange;
  CMTime v17;
  CMTimeRange start;
  __int128 v19;
  CMTimeEpoch v20;
  CMTime duration;
  CMTimeRange range;

  v6 = *(_DWORD *)(a2 + 12);
  if ((v6 & 1) == 0
    || (v7 = *(_DWORD *)(a2 + 36), (v7 & 1) == 0)
    || *(_QWORD *)(a2 + 40)
    || (*(_QWORD *)(a2 + 24) & 0x8000000000000000) != 0)
  {
    v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&range.start.value = *(_OWORD *)a2;
    *(_OWORD *)&range.start.epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
    _PFAssertFailHandler();
LABEL_15:
    start.start.value = *(_QWORD *)v3;
    start.start.timescale = *(_DWORD *)(v3 + 8);
    start.start.flags = v9;
    start.start.epoch = v10;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &start.start);
    _PFAssertFailHandler();
    goto LABEL_16;
  }
  if (((v7 | v6) & 0x10) != 0)
  {
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&range.start.value = *(_OWORD *)a2;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
    a1 = _PFAssertFailHandler();
  }
  v3 = a1;
  memset(&range, 0, sizeof(range));
  CMTimeMake(&duration, 1, 1);
  *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
  start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  CMTimeRangeMake(&range, &start.start, &duration);
  v19 = 0uLL;
  v20 = 0;
  v9 = *(_DWORD *)(v3 + 12);
  v10 = *(_QWORD *)(v3 + 16);
  if ((v9 & 1) == 0)
    goto LABEL_15;
  if ((*(_DWORD *)(v3 + 12) & 0x1D) != 1)
  {
LABEL_16:
    start.start.value = *(_QWORD *)v3;
    start.start.timescale = *(_DWORD *)(v3 + 8);
    start.start.flags = v9;
    start.start.epoch = v10;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &start.start);
    v15 = _PFAssertFailHandler();
    return (CMTime *)IPAMapNormalizedTimeRange(v15);
  }
  start.start.value = *(_QWORD *)v3;
  start.start.timescale = *(_DWORD *)(v3 + 8);
  start.start.flags = v9;
  start.start.epoch = v10;
  Seconds = CMTimeGetSeconds(&start.start);
  if (Seconds < 0.0 || Seconds > 1.0)
  {
    *(_OWORD *)&toRange.start.value = *(_OWORD *)v3;
    toRange.start.epoch = *(_QWORD *)(v3 + 16);
    start = range;
    IPAClipTime((uint64_t)&toRange, &start, (uint64_t)&v19);
  }
  else
  {
    v19 = *(_OWORD *)v3;
    v20 = *(_QWORD *)(v3 + 16);
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v17.epoch = v20;
  start = range;
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&toRange.start.value = *(_OWORD *)a2;
  *(_OWORD *)&toRange.start.epoch = v12;
  *(_OWORD *)&toRange.duration.timescale = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v17.value = v19;
  return CMTimeMapTimeFromRangeToRange((CMTime *)a3, &v17, &start, &toRange);
}

IPAVideoPlaybackSettings *IPAMapNormalizedTimeRange@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int v4;
  int v5;
  __int128 v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v13;
  IPAVideoPlaybackSettings *v14;
  SEL v15;
  id v16;
  CMTime end;
  CMTime v18;
  __int128 v19;
  CMTimeEpoch v20;
  CMTime v21;
  CMTimeRange range;

  v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 1) == 0
    || (v5 = *(_DWORD *)(a1 + 36), (v5 & 1) == 0)
    || *(_QWORD *)(a1 + 40)
    || (*(_QWORD *)(a1 + 24) & 0x8000000000000000) != 0)
  {
    v13 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&range.start.value = *(_OWORD *)a1;
    *(_OWORD *)&range.start.epoch = v13;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
    v14 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
    return -[IPAVideoPlaybackSettings initWithOperations:](v14, v15, v16);
  }
  else
  {
    if (((v5 | v4) & 0x10) != 0)
    {
      v6 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)&range.start.value = *(_OWORD *)a1;
      *(_OWORD *)&range.start.epoch = v6;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 32);
      CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
      a1 = _PFAssertFailHandler();
    }
    v7 = a2;
    v8 = *(_OWORD *)(a1 + 16);
    v18 = *(CMTime *)a1;
    memset(&v21, 0, sizeof(v21));
    v9 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&range.start.value = *(_OWORD *)a1;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = v9;
    CMTimeRangeGetEnd(&v21, &range);
    v19 = 0uLL;
    v20 = 0;
    v10 = v7[1];
    *(_OWORD *)&range.start.value = *v7;
    *(_OWORD *)&range.start.epoch = v10;
    *(_OWORD *)&range.duration.timescale = v7[2];
    IPAMapNormalizedTime((uint64_t)&v18, (uint64_t)&range, (uint64_t)&v19);
    memset(&v18, 0, sizeof(v18));
    end = v21;
    v11 = v7[1];
    *(_OWORD *)&range.start.value = *v7;
    *(_OWORD *)&range.start.epoch = v11;
    *(_OWORD *)&range.duration.timescale = v7[2];
    IPAMapNormalizedTime((uint64_t)&end, (uint64_t)&range, (uint64_t)&v18);
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)&range.start.value = v19;
    range.start.epoch = v20;
    end = v18;
    return (IPAVideoPlaybackSettings *)CMTimeRangeFromTimeToTime((CMTimeRange *)a3, &range.start, &end);
  }
}

void sub_1D4CB2B04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CB2BC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CB2CC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id thresholdForSizePolicy(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __thresholdForSizePolicy_block_invoke;
  v5[3] = &unk_1E986DA98;
  v6 = v1;
  v2 = v1;
  v3 = (void *)MEMORY[0x1D8266B30](v5);

  return v3;
}

BOOL __thresholdForSizePolicy_block_invoke(uint64_t a1, double a2, double a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = a2 * 1.05;
  v4 = a3 * 1.05;
  objc_msgSend(*(id *)(a1 + 32), "transformSize:", a2 * 1.05, a3 * 1.05);
  return v4 != v6 || v3 != v5;
}

const __CFString *NSStringFromImageStyle(int a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  result = 0;
  if (a1 > 31)
  {
    v3 = CFSTR("RKImageStyleFullSizePreview");
    v4 = CFSTR("RKImageStyleFaceTile");
    v5 = CFSTR("RKImageStyleMicro");
    if (a1 != 4096)
      v5 = 0;
    if (a1 != 2048)
      v4 = v5;
    if (a1 != 256)
      v3 = v4;
    v6 = CFSTR("RKImageStyleMaster");
    v7 = CFSTR("RKImageStyleLargePreview");
    if (a1 != 128)
      v7 = 0;
    if (a1 != 32)
      v6 = v7;
    if (a1 <= 255)
      return v6;
    else
      return v3;
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("RKImageStyleNotSpecified");
        break;
      case 1:
        result = CFSTR("RKImageStyleTiny");
        break;
      case 2:
        result = CFSTR("RKImageStyleMini");
        break;
      case 4:
        result = CFSTR("RKImageStyleThumbnail");
        break;
      case 8:
        result = CFSTR("RKImageStyleMasterThumbnail");
        break;
      default:
        return result;
    }
  }
  return result;
}

const __CFString *NSStringFromImageStyleShort(int a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  result = 0;
  if (a1 > 31)
  {
    v3 = CFSTR("fullszpv");
    v4 = CFSTR("facetile");
    v5 = CFSTR("micro");
    if (a1 != 4096)
      v5 = 0;
    if (a1 != 2048)
      v4 = v5;
    if (a1 != 256)
      v3 = v4;
    v6 = CFSTR("master");
    v7 = CFSTR("largepv");
    if (a1 != 128)
      v7 = 0;
    if (a1 != 32)
      v6 = v7;
    if (a1 <= 255)
      return v6;
    else
      return v3;
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("notspec");
        break;
      case 1:
        result = CFSTR("tiny");
        break;
      case 2:
        result = CFSTR("mini");
        break;
      case 4:
        result = CFSTR("thumb");
        break;
      case 8:
        result = CFSTR("mstrthum");
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1D4CB5C48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CB5D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id PA::Matrix4d::description(PA::Matrix4d *this)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%12.4f %12.4f %12.4f %12.4f\n"), *(_QWORD *)this, *((_QWORD *)this + 4), *((_QWORD *)this + 8), *((_QWORD *)this + 12));
  objc_msgSend(v2, "appendFormat:", CFSTR("%12.4f %12.4f %12.4f %12.4f\n"), *((_QWORD *)this + 1), *((_QWORD *)this + 5), *((_QWORD *)this + 9), *((_QWORD *)this + 13));
  objc_msgSend(v2, "appendFormat:", CFSTR("%12.4f %12.4f %12.4f %12.4f\n"), *((_QWORD *)this + 2), *((_QWORD *)this + 6), *((_QWORD *)this + 10), *((_QWORD *)this + 14));
  objc_msgSend(v2, "appendFormat:", CFSTR("%12.4f %12.4f %12.4f %12.4f\n"), *((_QWORD *)this + 3), *((_QWORD *)this + 7), *((_QWORD *)this + 11), *((_QWORD *)this + 15));
  return v2;
}

void sub_1D4CB5E94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL PA::Matrix4d::invert(PA::Matrix4d *this)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[48];
  __int128 v50;
  __int128 v51;
  _BYTE v52[48];

  v1 = 0;
  memset(&v49[8], 0, 32);
  *(_QWORD *)v49 = 0x3FF0000000000000;
  *(_QWORD *)&v49[40] = 0x3FF0000000000000;
  v50 = 0u;
  v51 = 0u;
  memset(&v52[8], 0, 32);
  *(_QWORD *)v52 = 0x3FF0000000000000;
  *(_QWORD *)&v52[40] = 0x3FF0000000000000;
  v2 = *((_OWORD *)this + 5);
  v45 = *((_OWORD *)this + 4);
  v46 = v2;
  v3 = *((_OWORD *)this + 7);
  v47 = *((_OWORD *)this + 6);
  v48 = v3;
  v4 = *((_OWORD *)this + 1);
  v41 = *(_OWORD *)this;
  v42 = v4;
  v5 = *((_OWORD *)this + 3);
  v6 = (char *)&v41 + 8;
  v43 = *((_OWORD *)this + 2);
  v44 = v5;
  while (1)
  {
    v7 = *((double *)&v41 + 5 * v1);
    if (v1 == 3)
    {
      v8 = 15;
      v9 = 11;
      v10 = 7;
    }
    else
    {
      v11 = 0;
      v12 = v1;
      do
      {
        v13 = fabs(*(double *)&v6[8 * v11]);
        v14 = fabs(v7);
        if (v13 > v14)
          v7 = *(double *)&v6[8 * v11];
        ++v11;
        if (v13 > v14)
          v12 = v1 + v11;
      }
      while (v1 + v11 != 3);
      v10 = v1 + 4;
      v9 = v1 + 8;
      v8 = v1 + 12;
      if (v12 != v1)
      {
        v15 = *(_QWORD *)&v49[8 * v1];
        *(_QWORD *)&v49[8 * v1] = *(_QWORD *)&v49[8 * v12];
        *(_QWORD *)&v49[8 * v12] = v15;
        v16 = *((_QWORD *)&v41 + v1);
        *((_QWORD *)&v41 + v1) = *((_QWORD *)&v41 + v12);
        *((_QWORD *)&v41 + v12) = v16;
        v17 = 8 * v12;
        v18 = v17 + 32;
        v19 = *(_QWORD *)&v49[8 * v10];
        *(_QWORD *)&v49[8 * v10] = *(_QWORD *)&v49[v17 + 32];
        *(_QWORD *)&v49[v18] = v19;
        v20 = *((_QWORD *)&v41 + v10);
        *((_QWORD *)&v41 + v10) = *(_QWORD *)((char *)&v41 + v17 + 32);
        *(_QWORD *)((char *)&v41 + v18) = v20;
        v21 = v17 + 64;
        v22 = *(_QWORD *)&v49[8 * v9];
        *(_QWORD *)&v49[8 * v9] = *(_QWORD *)&v49[v17 + 64];
        *(_QWORD *)&v49[v21] = v22;
        v23 = *((_QWORD *)&v41 + v9);
        *((_QWORD *)&v41 + v9) = *(_QWORD *)((char *)&v41 + v17 + 64);
        *(_QWORD *)((char *)&v41 + v21) = v23;
        v17 += 96;
        v24 = *(_QWORD *)&v49[8 * v8];
        *(_QWORD *)&v49[8 * v8] = *(_QWORD *)&v49[v17];
        *(_QWORD *)&v49[v17] = v24;
        v25 = *((_QWORD *)&v41 + v8);
        *((_QWORD *)&v41 + v8) = *(_QWORD *)((char *)&v41 + v17);
        *(_QWORD *)((char *)&v41 + v17) = v25;
      }
    }
    if (v7 == 0.0)
      return v7 != 0.0;
    v26 = 1.0 / v7 * *((double *)&v41 + v1);
    *((double *)&v41 + v1) = v26;
    v27 = 1.0 / v7 * *(double *)&v49[8 * v1];
    *(double *)&v49[8 * v1] = v27;
    *((double *)&v41 + v10) = 1.0 / v7 * *((double *)&v41 + v10);
    *(double *)&v49[8 * v10] = 1.0 / v7 * *(double *)&v49[8 * v10];
    *((double *)&v41 + v9) = 1.0 / v7 * *((double *)&v41 + v9);
    *(double *)&v49[8 * v9] = 1.0 / v7 * *(double *)&v49[8 * v9];
    *((double *)&v41 + v8) = 1.0 / v7 * *((double *)&v41 + v8);
    *(double *)&v49[8 * v8] = 1.0 / v7 * *(double *)&v49[8 * v8];
    v28 = 32 * v1;
    if (!v1)
      goto LABEL_16;
    v29 = *((double *)&v41 + 4 * v1);
    *(double *)&v41 = *(double *)&v41 - v26 * v29;
    *(double *)v49 = *(double *)v49 - v27 * v29;
    v30 = *(double *)&v49[8 * v10];
    *(double *)&v43 = *(double *)&v43 - *((double *)&v41 + v10) * v29;
    *(double *)&v49[32] = *(double *)&v49[32] - v30 * v29;
    *(double *)&v45 = *(double *)&v45 - *((double *)&v41 + v9) * v29;
    *(double *)&v51 = *(double *)&v51 - *(double *)&v49[8 * v9] * v29;
    *(double *)&v47 = *(double *)&v47 - *((double *)&v41 + v8) * v29;
    *(double *)&v52[16] = *(double *)&v52[16] - *(double *)&v49[8 * v8] * v29;
    if (v1 != 1)
    {
      v26 = *((double *)&v41 + v1);
      v27 = *(double *)&v49[8 * v1];
LABEL_16:
      v31 = *(double *)((char *)&v41 + (v28 | 8));
      *((double *)&v41 + 1) = *((double *)&v41 + 1) - v26 * v31;
      *(double *)&v49[8] = *(double *)&v49[8] - v27 * v31;
      v32 = *(double *)&v49[8 * v10];
      *((double *)&v43 + 1) = *((double *)&v43 + 1) - *((double *)&v41 + v10) * v31;
      *(double *)&v49[40] = *(double *)&v49[40] - v32 * v31;
      *((double *)&v45 + 1) = *((double *)&v45 + 1) - *((double *)&v41 + v9) * v31;
      *((double *)&v51 + 1) = *((double *)&v51 + 1) - *(double *)&v49[8 * v9] * v31;
      *((double *)&v47 + 1) = *((double *)&v47 + 1) - *((double *)&v41 + v8) * v31;
      *(double *)&v52[24] = *(double *)&v52[24] - *(double *)&v49[8 * v8] * v31;
      if (v1 == 2)
        goto LABEL_18;
    }
    v33 = *(double *)((char *)&v41 + (v28 | 0x10));
    *(double *)&v42 = *(double *)&v42 - *((double *)&v41 + v1) * v33;
    *(double *)&v49[16] = *(double *)&v49[16] - *(double *)&v49[8 * v1] * v33;
    v34 = *(double *)&v49[8 * v10];
    *(double *)&v44 = *(double *)&v44 - *((double *)&v41 + v10) * v33;
    *(double *)&v50 = *(double *)&v50 - v34 * v33;
    *(double *)&v46 = *(double *)&v46 - *((double *)&v41 + v9) * v33;
    *(double *)v52 = *(double *)v52 - *(double *)&v49[8 * v9] * v33;
    *(double *)&v48 = *(double *)&v48 - *((double *)&v41 + v8) * v33;
    *(double *)&v52[32] = *(double *)&v52[32] - *(double *)&v49[8 * v8] * v33;
    if (v1 == 3)
    {
      v36 = *(_OWORD *)v52;
      *((_OWORD *)this + 4) = v51;
      *((_OWORD *)this + 5) = v36;
      v37 = *(_OWORD *)&v52[32];
      *((_OWORD *)this + 6) = *(_OWORD *)&v52[16];
      *((_OWORD *)this + 7) = v37;
      v38 = *(_OWORD *)&v49[16];
      *(_OWORD *)this = *(_OWORD *)v49;
      *((_OWORD *)this + 1) = v38;
      v39 = v50;
      *((_OWORD *)this + 2) = *(_OWORD *)&v49[32];
      *((_OWORD *)this + 3) = v39;
      return v7 != 0.0;
    }
LABEL_18:
    v35 = *(double *)((char *)&v41 + (v28 | 0x18));
    *((double *)&v42 + 1) = *((double *)&v42 + 1) - *((double *)&v41 + v1) * v35;
    *(double *)&v49[24] = *(double *)&v49[24] - *(double *)&v49[8 * v1] * v35;
    *((double *)&v44 + 1) = *((double *)&v44 + 1) - *((double *)&v41 + v10) * v35;
    *((double *)&v50 + 1) = *((double *)&v50 + 1) - *(double *)&v49[8 * v10] * v35;
    *((double *)&v46 + 1) = *((double *)&v46 + 1) - *((double *)&v41 + v9) * v35;
    *(double *)&v52[8] = *(double *)&v52[8] - *(double *)&v49[8 * v9] * v35;
    *((double *)&v48 + 1) = *((double *)&v48 + 1) - *((double *)&v41 + v8) * v35;
    *(double *)&v52[40] = *(double *)&v52[40] - *(double *)&v49[8 * v8] * v35;
    v6 += 40;
    ++v1;
  }
}

id IPAAdjustmentGetLog()
{
  if (IPAMakeLogs_predicate != -1)
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_341);
  return (id)adjustmentLog;
}

id IPAVideoGetLog()
{
  if (IPAMakeLogs_predicate != -1)
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_341);
  return (id)videoLog;
}

id IPAColorTransformGetLog()
{
  if (IPAMakeLogs_predicate != -1)
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_341);
  return (id)colorTransformLog;
}

id IPAAdjustmentError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  if (!objc_msgSend(v10, "length"))
  {
    v12 = 0;
    goto LABEL_5;
  }
  v16 = &a9;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
  v12 = (void *)v11;
  if (!v11)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v17 = CFSTR("reason");
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IPAAdjustmentErrorDomain"), a1, v13, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void IPAAdjustmentCurrentVersionForIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = v1;
  if (IPAAdjustmentCurrentVersionForIdentifier_s_guard != -1)
  {
    dispatch_once(&IPAAdjustmentCurrentVersionForIdentifier_s_guard, &__block_literal_global_741);
    if (v2)
      goto LABEL_3;
LABEL_7:
    _PFAssertFailHandler();
    __IPAAdjustmentCurrentVersionForIdentifier_block_invoke();
    return;
  }
  if (!v1)
    goto LABEL_7;
LABEL_3:
  objc_msgSend((id)IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v4 = v3;
}

uint64_t IPAAdjustmentsComeFromSupportedApp(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = v1;
  if (IPAAdjustmentsComeFromSupportedApp_s_guard != -1)
  {
    dispatch_once(&IPAAdjustmentsComeFromSupportedApp_s_guard, &__block_literal_global_333);
    if (v2)
      goto LABEL_3;
LABEL_8:
    v4 = 1;
    goto LABEL_9;
  }
  if (!v1)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend((id)IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators, "containsObject:", v3);
  else
    v4 = 0;

LABEL_9:
  return v4;
}

uint64_t IPAAdjustmentsComeFromOSXPhotos(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (IPAAdjustmentsComeFromOSXPhotos_s_guard != -1)
    dispatch_once(&IPAAdjustmentsComeFromOSXPhotos_s_guard, &__block_literal_global_340);
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend((id)IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators, "containsObject:", v2);
  else
    v3 = 0;

  return v3;
}

void sub_1D4CB6E24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CB6EF0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x1D82668A8](v2, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

void sub_1D4CB7034(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v5;

  v5 = *(void **)v3;
  if (*(_QWORD *)v3)
  {
    *(_QWORD *)(v3 + 8) = v5;
    operator delete(v5);
  }
  MEMORY[0x1D82668A8](v3, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

void sub_1D4CB71E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1D4CB7300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::vector<PA::Rect>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]();
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E986D578, MEMORY[0x1E0DE42E0]);
}

void sub_1D4CB7354(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void sub_1D4CB752C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CB7834(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::vector<PA::Rect>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(unint64_t a1)
{
  if (a1 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E986D570, MEMORY[0x1E0DE42D0]);
}

void sub_1D4CB7938(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

char *std::vector<PA::Rect>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<PA::Rect>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void sub_1D4CB79F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CBADB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBAE6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBAEE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBAF94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBB244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D4CBB56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CBB67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CBBA34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBBB54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBBC34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x1D82668A8](v4, 0x10A0C408EF24B1CLL);

  _Unwind_Resume(a1);
}

void sub_1D4CBBD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1D4CBBEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1D4CBC04C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBC274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBC2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL PA::Region::Includes(PA::Region *this, const PA::Region *a2)
{
  _BOOL8 v3;
  _BYTE v5[24];
  uint64_t v6;

  if (!*((_QWORD *)a2 + 3))
    return 0;
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  PA::Region::Break(*((_QWORD *)this + 2), (uint64_t)v5);
  PA::Region::MergeVertically((PA::Region *)v5);
  v3 = v6 == 0;
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void sub_1D4CBC3BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_1D4CBC42C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Break(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  double *v5;
  uint64_t *v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  int v25;
  __int128 v26;
  double v27[4];

  if (result)
  {
    v3 = result;
    v4 = (uint64_t *)(a2 + 16);
    do
    {
      v23 = 0u;
      v24 = 0u;
      v5 = (double *)(v3 + 16);
      v6 = v4;
      v25 = 1065353216;
      while (1)
      {
        v6 = (uint64_t *)*v6;
        if (!v6)
          break;
        v7 = (double *)(v6 + 2);
        if (PA::Rect::Intersects((CGRect *)(v6 + 2), (const Rect *)(v3 + 16)))
        {
          v8 = *((double *)v6 + 2);
          v9 = *((double *)v6 + 3);
          v10 = *((double *)v6 + 4);
          v11 = *((double *)v6 + 5);
          v12 = *(double *)(v3 + 24);
          if (v9 >= v12)
          {
            v15 = *((double *)v6 + 2);
            v14 = *(double *)(v3 + 24);
            v12 = *((double *)v6 + 3);
            v13 = *((double *)v6 + 5);
          }
          else
          {
            *(_QWORD *)&v26 = v6[2];
            *((double *)&v26 + 1) = v9;
            v27[0] = v10;
            v27[1] = v12 - v9;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            v13 = v9 + v11 - v12;
            v11 = *((double *)v6 + 5);
            v14 = *(double *)(v3 + 24);
            v15 = *((double *)v6 + 2);
            v9 = *((double *)v6 + 3);
          }
          v17 = v9 + v11;
          v18 = v14 + *(double *)(v3 + 40);
          if (v17 > v18)
          {
            v19 = *((double *)v6 + 4);
            *(double *)&v26 = v15;
            *((double *)&v26 + 1) = v18;
            v27[0] = v19;
            v27[1] = v17 - v18;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            v13 = v18 - v12;
            v15 = *v7;
          }
          v20 = *v5;
          if (v15 < *v5)
          {
            *(double *)&v26 = v8;
            *((double *)&v26 + 1) = v12;
            v27[0] = v20 - v8;
            v27[1] = v13;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            v15 = *v7;
            v20 = *v5;
          }
          v21 = v15 + *((double *)v6 + 4);
          v22 = v20 + *(double *)(v3 + 32);
          if (v21 > v22)
          {
            *(double *)&v26 = v20 + *(double *)(v3 + 32);
            *((double *)&v26 + 1) = v12;
            v27[0] = v8 + v10 - v22;
            v27[1] = v13;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
          }
        }
        else
        {
          v16 = *((_OWORD *)v6 + 2);
          v26 = *(_OWORD *)v7;
          *(_OWORD *)v27 = v16;
          std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
        }
      }
      if (&v23 != (__int128 *)a2)
      {
        *(_DWORD *)(a2 + 32) = v25;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>((_QWORD *)a2, (uint64_t *)v24);
      }
      result = std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v23);
      v3 = *(_QWORD *)v3;
    }
    while (v3);
  }
  return result;
}

void sub_1D4CBC624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::MergeVertically(PA::Region *this)
{
  double *i;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  _QWORD v15[5];
  __int128 v16;
  void *__p[2];
  int v18;

  v16 = 0u;
  *(_OWORD *)__p = 0u;
  v18 = 1065353216;
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>((uint64_t)&v16, (unint64_t)(float)*((unint64_t *)this + 3));
  for (i = (double *)*((_QWORD *)this + 2); i; i = *(double **)i)
  {
    v3 = i[2];
    v4 = i[3];
    v5 = i[4];
    v6 = i[5];
    v7 = (double *)__p[0];
    if (__p[0])
    {
      v8 = i[3];
      do
      {
        while (1)
        {
          v9 = v7[3];
          v10 = v7[2];
          if ((COERCE_DOUBLE((COERCE__INT64(v4 + v6) + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*(_QWORD *)&v9 + 4095) & 0xFFFFFFFFFFFFF000)
             || COERCE_DOUBLE((*(_QWORD *)&v4 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v9 + v7[5])
                                                                                                + 4095) & 0xFFFFFFFFFFFFF000))
            && COERCE_DOUBLE((*(_QWORD *)&v3 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*(_QWORD *)&v10 + 4095) & 0xFFFFFFFFFFFFF000)
            && COERCE_DOUBLE((COERCE__INT64(v3 + v5) + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v10 + v7[4]) + 4095) & 0xFFFFFFFFFFFFF000))
          {
            break;
          }
          v7 = *(double **)v7;
          if (!v7)
            goto LABEL_18;
        }
        if (v9 >= v8)
          v4 = v8;
        else
          v4 = v7[3];
        v12 = v4 + v8 + v6 - v4;
        v13 = v9 + v7[5];
        if (v12 < v13)
          v12 = v13;
        v6 = v12 - v4;
        v7 = (double *)std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(&v16, (uint64_t *)v7);
        v8 = v4;
      }
      while (v7);
    }
LABEL_18:
    *(double *)v15 = v3;
    *(double *)&v15[1] = v4;
    *(double *)&v15[2] = v5;
    *(double *)&v15[3] = v6;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v16, v15, (uint64_t)v15);
  }
  if (&v16 != (__int128 *)this)
  {
    *((_DWORD *)this + 8) = v18;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(this, (uint64_t *)__p[0]);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v16);
}

void sub_1D4CBC800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t i;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  _BYTE *v9;
  _OWORD *v10;
  uint64_t v11;
  __int128 v12;
  _BYTE *v13;

  v4 = a1[1];
  if (!v4)
    goto LABEL_9;
  for (i = 0; i != v4; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v6 = (_BYTE *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      v7 = *((_OWORD *)a2 + 1);
      v8 = *((_OWORD *)a2 + 2);
      v6[48] = *((_BYTE *)a2 + 48);
      *((_OWORD *)v6 + 1) = v7;
      *((_OWORD *)v6 + 2) = v8;
      v9 = *(_BYTE **)v6;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v6);
      a2 = (uint64_t *)*a2;
      v6 = v9;
      if (!v9)
        goto LABEL_9;
    }
    do
    {
      v13 = *(_BYTE **)v6;
      operator delete(v6);
      v6 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    while (a2)
    {
      v10 = operator new(0x38uLL);
      *(_QWORD *)v10 = 0;
      v11 = a2[6];
      v12 = *((_OWORD *)a2 + 2);
      v10[1] = *((_OWORD *)a2 + 1);
      v10[2] = v12;
      *((_QWORD *)v10 + 6) = v11;
      *((_QWORD *)v10 + 1) = (*((_QWORD *)v10 + 2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(*((_QWORD *)v10 + 3) + 4095) >> 32 << 24) ^ ((unint64_t)(*((_QWORD *)v10 + 4) + 4095) >> 32 << 8) ^ ((unint64_t)(*((_QWORD *)v10 + 5) + 4095) >> 32);
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v10);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_1D4CBCB64(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1D4CBCB84(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(_QWORD *a1, uint64_t *__p)
{
  int8x8_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8x8_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v2 = (int8x8_t)a1[1];
  v4 = *__p;
  v3 = __p[1];
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    v7 = v6;
    v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v2)
        v8 %= *(_QWORD *)&v2;
    }
    else
    {
      v8 &= *(_QWORD *)&v2 - 1;
    }
    v9 = *__p;
    if (v8 == v3)
    {
LABEL_20:
      if (!v9)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  if (!v4)
    goto LABEL_19;
  v10 = *(_QWORD *)(v4 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(_QWORD *)&v2)
      v10 %= *(_QWORD *)&v2;
  }
  else
  {
    v10 &= *(_QWORD *)&v2 - 1;
  }
  v9 = *__p;
  if (v10 != v3)
  {
LABEL_19:
    *(_QWORD *)(*a1 + 8 * v3) = 0;
    v9 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  v11 = *(_QWORD *)(v9 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v11 >= *(_QWORD *)&v2)
      v11 %= *(_QWORD *)&v2;
  }
  else
  {
    v11 &= *(_QWORD *)&v2 - 1;
  }
  if (v11 != v3)
  {
    *(_QWORD *)(*a1 + 8 * v11) = v7;
    v9 = *__p;
  }
LABEL_27:
  *v7 = v9;
  *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  __int128 v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v6 = (*a2 + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(a2[1] + 4095) >> 32 << 24) ^ ((unint64_t)(a2[2] + 4095) >> 32 << 8);
  v7 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = v7 & (v8 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      v13 = (_QWORD *)*v12;
      if (*v12)
      {
        do
        {
          v14 = v13[1];
          if (v14 == v7)
          {
            if (PA::RectEqualTo::operator()(v13 + 2, a2))
              return;
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v8)
                v14 %= v8;
            }
            else
            {
              v14 &= v8 - 1;
            }
            if (v14 != v3)
              break;
          }
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
    }
  }
  v15 = operator new(0x38uLL);
  *v15 = 0;
  v15[1] = v7;
  v16 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v16;
  v15[6] = *(_QWORD *)(a3 + 32);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    v19 = 1;
    if (v8 >= 3)
      v19 = (v8 & (v8 - 1)) != 0;
    v20 = v19 | (2 * v8);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, v22);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *v15 = *v24;
LABEL_38:
    *v24 = v15;
    goto LABEL_39;
  }
  *v15 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(v23 + 8 * v3) = a1 + 16;
  if (*v15)
  {
    v25 = *(_QWORD *)(*v15 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8)
        v25 %= v8;
    }
    else
    {
      v25 &= v8 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
}

void sub_1D4CBCF34(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL PA::RectEqualTo::operator()(_QWORD *a1, _QWORD *a2)
{
  return COERCE_DOUBLE((*a1 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*a2 + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[1] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[1] + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[2] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[2] + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[3] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[3] + 4095) & 0xFFFFFFFFFFFFF000);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  int8x16_t v5;
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  int8x8_t prime;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  uint8x8_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  int v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  _BOOL4 v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;

  v2 = (_QWORD *)a2;
  v4 = (_QWORD *)(a2 + 16);
  v5 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(a2 + 24), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1D4CCD110), (int8x16_t)xmmword_1D4CCD120);
  v43 = v5.i64[0] ^ (*(_QWORD *)(a2 + 16) + 4095) & 0xFFFFFFFF00000000 ^ v5.i64[1] ^ ((unint64_t)(*(_QWORD *)(a2 + 40) + 4095) >> 32);
  *(_QWORD *)(a2 + 8) = v43;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      prime = (int8x8_t)v11;
    else
      prime = (int8x8_t)v10;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_95;
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_55;
    v20 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (v21 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v21.i16[0] = vaddlv_u8(v21), v21.u32[0] > 1uLL))
    {
      v20 = std::__next_prime(v20);
    }
    else
    {
      v22 = 1 << -(char)__clz(v20 - 1);
      if (v20 >= 2)
        v20 = v22;
    }
    if (*(_QWORD *)&prime <= v20)
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_55;
    }
    if (prime)
    {
LABEL_95:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(8 * *(_QWORD *)&prime);
      v14 = *(void **)a1;
      *(_QWORD *)a1 = v13;
      if (v14)
        operator delete(v14);
      v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v15++) = 0;
      while (*(_QWORD *)&prime != v15);
      v16 = *(_QWORD **)(a1 + 16);
      if (!v16)
        goto LABEL_45;
      v17 = v16[1];
      v18 = (uint8x8_t)vcnt_s8(prime);
      v18.i16[0] = vaddlv_u8(v18);
      v19 = v18.u32[0];
      if (v18.u32[0] > 1uLL)
      {
        if (v17 >= *(_QWORD *)&prime)
          v17 %= *(_QWORD *)&prime;
      }
      else
      {
        v17 &= *(_QWORD *)&prime - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v17) = a1 + 16;
      v23 = (_QWORD *)*v16;
      if (*v16)
      {
        v41 = v2;
        do
        {
          v24 = v23[1];
          if (v19 > 1)
          {
            if (v24 >= *(_QWORD *)&prime)
              v24 %= *(_QWORD *)&prime;
          }
          else
          {
            v24 &= *(_QWORD *)&prime - 1;
          }
          if (v24 == v17)
          {
            v16 = v23;
          }
          else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v24))
          {
            v42 = v17;
            v25 = v4;
            v26 = v23;
            do
            {
              v27 = v26;
              v26 = (_QWORD *)*v26;
            }
            while (v26 && PA::RectEqualTo::operator()(v23 + 2, v26 + 2));
            *v16 = v26;
            *v27 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v24);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v24) = v23;
            v4 = v25;
            v17 = v42;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v16;
            v16 = v23;
            v17 = v24;
          }
          v23 = (_QWORD *)*v16;
        }
        while (*v16);
        v6 = (unint64_t)prime;
        v2 = v41;
      }
      else
      {
LABEL_45:
        v6 = (unint64_t)prime;
      }
    }
    else
    {
      v28 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v28)
        operator delete(v28);
      v6 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_55:
  v29 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v29.i16[0] = vaddlv_u8(v29);
  v30 = v29.u32[0];
  if (v29.u32[0] > 1uLL)
  {
    v31 = v43;
    if (v6 <= v43)
      v31 = v43 % v6;
  }
  else
  {
    v31 = (v6 - 1) & v43;
  }
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v31);
  if (v32)
  {
    v33 = 0;
    do
    {
      v34 = v32;
      v32 = (_QWORD *)*v32;
      if (!v32)
        break;
      v35 = v32[1];
      if (v30 > 1)
      {
        v36 = v32[1];
        if (v35 >= v6)
          v36 = v35 % v6;
      }
      else
      {
        v36 = v35 & (v6 - 1);
      }
      if (v36 != v31)
        break;
      v37 = v35 == v43 && PA::RectEqualTo::operator()(v32 + 2, v4);
      v38 = v33 & !v37;
      v33 |= v37;
    }
    while (v38 != 1);
  }
  else
  {
    v34 = 0;
  }
  v39 = v2[1];
  if (v30 > 1)
  {
    if (v39 >= v6)
      v39 %= v6;
  }
  else
  {
    v39 &= v6 - 1;
  }
  if (!v34)
  {
    *v2 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v39) = a1 + 16;
    if (!*v2)
      goto LABEL_91;
    v40 = *(_QWORD *)(*v2 + 8);
    if (v30 > 1)
    {
      if (v40 >= v6)
        v40 %= v6;
    }
    else
    {
      v40 &= v6 - 1;
    }
LABEL_90:
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v40) = v2;
    goto LABEL_91;
  }
  *v2 = *v34;
  *v34 = v2;
  if (*v2)
  {
    v40 = *(_QWORD *)(*v2 + 8);
    if (v30 > 1)
    {
      if (v40 >= v6)
        v40 %= v6;
    }
    else
    {
      v40 &= v6 - 1;
    }
    if (v40 != v39)
      goto LABEL_90;
  }
LABEL_91:
  ++*(_QWORD *)(a1 + 24);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL PA::Rect::Intersects(CGRect *this, const Rect *a2)
{
  CGRect v3;

  *(Rect *)&v3.origin.x = *a2;
  *(Rect *)&v3.origin.y = a2[1];
  *(Rect *)&v3.size.width = a2[2];
  *(Rect *)&v3.size.height = a2[3];
  return CGRectIntersectsRect(*this, v3);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  __int128 v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v6 = (*a2 + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(a2[1] + 4095) >> 32 << 24) ^ ((unint64_t)(a2[2] + 4095) >> 32 << 8);
  v7 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = v7 & (v8 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      v13 = (_QWORD *)*v12;
      if (*v12)
      {
        do
        {
          v14 = v13[1];
          if (v14 == v7)
          {
            if (PA::RectEqualTo::operator()(v13 + 2, a2))
              return;
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v8)
                v14 %= v8;
            }
            else
            {
              v14 &= v8 - 1;
            }
            if (v14 != v3)
              break;
          }
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
    }
  }
  v15 = operator new(0x38uLL);
  *v15 = 0;
  v15[1] = v7;
  v16 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v16;
  v15[6] = *(_QWORD *)(a3 + 32);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    v19 = 1;
    if (v8 >= 3)
      v19 = (v8 & (v8 - 1)) != 0;
    v20 = v19 | (2 * v8);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, v22);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *v15 = *v24;
LABEL_38:
    *v24 = v15;
    goto LABEL_39;
  }
  *v15 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(v23 + 8 * v3) = a1 + 16;
  if (*v15)
  {
    v25 = *(_QWORD *)(*v15 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8)
        v25 %= v8;
    }
    else
    {
      v25 &= v8 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
}

void sub_1D4CBD718(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

PA::Region *PA::Region::Region(PA::Region *this, const PA::Rect *a2)
{
  double v4;
  double v5;
  __int128 v6;
  void *v8;
  void *v9;
  _OWORD v10[3];

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  if ((*(_QWORD *)a2 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*((_QWORD *)a2 + 1) & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (v4 = *((double *)a2 + 2), (*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    || (v5 = *((double *)a2 + 3), (*(_QWORD *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PA::Region::Region(const Rect &)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("IPARegion.mm"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rect.IsFinite()"));

    v4 = *((double *)a2 + 2);
    v5 = *((double *)a2 + 3);
  }
  if (v4 > 0.0 && v5 > 0.0)
  {
    v6 = *((_OWORD *)a2 + 1);
    v10[0] = *(_OWORD *)a2;
    v10[1] = v6;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)this, v10, (uint64_t)v10);
  }
  return this;
}

void sub_1D4CBD858(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Intersects(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;

  if (result)
  {
    v2 = result;
    v3 = (uint64_t *)(a2 + 16);
    do
    {
      v4 = v3;
      while (1)
      {
        v4 = (uint64_t *)*v4;
        if (!v4)
          break;
        if (PA::Rect::Intersects((CGRect *)(v4 + 2), (const Rect *)(v2 + 16)))
          return 1;
      }
      v2 = *(_QWORD *)v2;
    }
    while (v2);
    return 0;
  }
  return result;
}

double PA::Region::GetBounds(PA::Region *this)
{
  double v1;
  uint64_t v2;
  double v3;
  double v4;
  PA::Region *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;

  v1 = *MEMORY[0x1E0C9D648];
  v2 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!this)
    return *MEMORY[0x1E0C9D648];
  v5 = this;
  do
  {
    v6 = *((double *)v5 + 2);
    v7 = *((_QWORD *)v5 + 3);
    v8 = *((double *)v5 + 4);
    v9 = *((double *)v5 + 5);
    if (v3 > 0.0 && v4 > 0.0)
    {
      if (v8 > 0.0 && v9 > 0.0)
        *(CGRect *)&v1 = CGRectUnion(*(CGRect *)&v1, *(CGRect *)&v6);
      v6 = v1;
      v7 = v2;
      v8 = v3;
      v9 = v4;
    }
    v5 = *(PA::Region **)v5;
    v1 = v6;
    v2 = v7;
    v3 = v8;
    v4 = v9;
  }
  while (v5);
  return v6;
}

void sub_1D4CBDA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBDAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CBDB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CBDBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CBDC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBDD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBDDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBDEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBDF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CBE23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBE30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBE3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::RoundUp(PA::Region *this)
{
  float64x2_t *i;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v7[2];
  _BYTE v8[16];
  float64x2_t *v9;

  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v8, (uint64_t)this);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(this);
  for (i = v9; i; i = *(float64x2_t **)&i->f64[0])
  {
    v3 = i[2];
    v7[0] = i[1];
    v4 = vrndmq_f64(v7[0]);
    v5 = vsubq_f64(vrndpq_f64(vaddq_f64(v4, vsubq_f64(vaddq_f64(v7[0], v3), v4))), v4);
    v7[0] = v4;
    v7[1] = v5;
    PA::Region::Add(this, (const PA::Rect *)v7);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v8);
}

void sub_1D4CBE470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t PA::Region::Add(PA::Region *this, const PA::Rect *a2)
{
  _BYTE v4[40];

  PA::Region::Region((PA::Region *)v4, a2);
  PA::Region::Add(this, (const PA::Region *)v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1D4CBE5C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Add(PA::Region *this, const PA::Region *a2)
{
  _QWORD v4[5];

  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v4, (uint64_t)a2);
  PA::Region::Break(*((_QWORD *)this + 2), (uint64_t)v4);
  PA::Region::Merge(this, v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1D4CBE628(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Merge(PA::Region *this, _QWORD *a2)
{
  uint64_t v4;
  double v5;
  float64x2_t v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  int8x16_t v19;
  double v20;
  float64_t v21;
  double v22;
  float64_t v23;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;

  while (a2[3])
  {
    v4 = a2[2];
    v25 = *(float64x2_t *)(v4 + 16);
    v26 = *(float64x2_t *)(v4 + 32);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(a2, (uint64_t *)v4);
    v6 = vaddq_f64(v25, v26);
    v5 = v6.f64[1];
    *(_QWORD *)&v6.f64[0] = (*(_QWORD *)&v6.f64[0] + 4095) & 0xFFFFFFFFFFFFF000;
    v7 = (double *)((char *)this + 16);
    while (1)
    {
      v7 = *(double **)v7;
      if (!v7)
      {
        v27 = v25;
        v28 = v26;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)this, &v27, (uint64_t)&v27);
        goto LABEL_22;
      }
      v8 = v7[3];
      if (v6.f64[0] == COERCE_DOUBLE((*((_QWORD *)v7 + 2) + 4095) & 0xFFFFFFFFFFFFF000)
        || COERCE_DOUBLE((*(_QWORD *)&v25.f64[0] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v7[2] + v7[4]) + 4095) & 0xFFFFFFFFFFFFF000))
      {
        *(_QWORD *)&v9 = (COERCE__INT64(v8 + v7[5]) + 4095) & 0xFFFFFFFFFFFFF000;
        *(_QWORD *)&v10 = (*(_QWORD *)&v8 + 4095) & 0xFFFFFFFFFFFFF000;
        if (COERCE_DOUBLE((*(_QWORD *)&v25.f64[1] + 4095) & 0xFFFFFFFFFFFFF000) < v9
          && COERCE_DOUBLE((*(_QWORD *)&v6.f64[1] + 4095) & 0xFFFFFFFFFFFFF000) > v10)
        {
          break;
        }
      }
    }
    v12.f64[0] = v7[2];
    v12.f64[1] = v25.f64[1];
    v13.f64[0] = v25.f64[0];
    v13.f64[1] = v7[3];
    v14 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v12), *(int8x16_t *)(v7 + 2), (int8x16_t)v25);
    v15.f64[0] = v26.f64[0];
    v15.f64[1] = v7[5];
    v16.f64[1] = v26.f64[1];
    v16.f64[0] = v7[4];
    v17 = vaddq_f64(v12, v16);
    v18 = vaddq_f64(v13, v15);
    v19 = (int8x16_t)vcgtq_f64(v17, v18);
    v15.f64[0] = v17.f64[0];
    v15.f64[1] = v18.f64[1];
    v18.f64[1] = v17.f64[1];
    v27 = v14;
    v28 = vsubq_f64((float64x2_t)vbslq_s8(v19, (int8x16_t)v15, (int8x16_t)v18), v14);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
    v20 = v7[3];
    if (v25.f64[1] >= v20)
    {
      if (v25.f64[1] <= v20)
        goto LABEL_16;
      v21 = v7[4];
      v27.f64[0] = v7[2];
      v27.f64[1] = v20;
      v28.f64[0] = v21;
      v28.f64[1] = v25.f64[1] - v20;
    }
    else
    {
      v27 = v25;
      v28.f64[0] = v26.f64[0];
      v28.f64[1] = v20 - v25.f64[1];
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
LABEL_16:
    v22 = v7[3] + v7[5];
    if (v5 >= v22)
    {
      if (v5 <= v22)
        goto LABEL_21;
      v27.f64[0] = v25.f64[0];
      v27.f64[1] = v22;
      v28.f64[0] = v26.f64[0];
      v28.f64[1] = v5 - v22;
    }
    else
    {
      v23 = v7[4];
      v27.f64[0] = v7[2];
      v27.f64[1] = v5;
      v28.f64[0] = v23;
      v28.f64[1] = v22 - v5;
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
LABEL_21:
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(this, (uint64_t *)v7);
LABEL_22:
    ;
  }
  return PA::Region::MergeVertically(this);
}

uint64_t PA::Region::ShrinkInRect(PA::Region *this, float64_t a2, float64_t a3, const PA::Rect *a4)
{
  uint64_t v9[5];
  _BYTE v10[16];
  uint64_t v11;

  PA::Region::Region((PA::Region *)v10, a4);
  PA::Region::Break(*((_QWORD *)this + 2), (uint64_t)v10);
  PA::Region::MergeVertically((PA::Region *)v10);
  PA::Region::Grow((PA::Region *)v10, a2, a3);
  PA::Region::Region((PA::Region *)v9, a4);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign((uint64_t)this, v9);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v9);
  PA::Region::Break(v11, (uint64_t)this);
  PA::Region::MergeVertically(this);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v10);
}

void sub_1D4CBE93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Grow(PA::Region *this, float64_t a2, float64_t a3)
{
  float64x2_t *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v12;
  float64x2_t v13[2];
  _BYTE v14[16];
  float64x2_t *v15;

  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v14, (uint64_t)this);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(this);
  v4 = v15;
  if (v15)
  {
    v5.f64[0] = a2;
    v5.f64[1] = a3;
    v12 = v5;
    do
    {
      v6 = v4[2];
      v13[0] = v4[1];
      v7 = vsubq_f64(v13[0], v12);
      v8 = vsubq_f64(vaddq_f64(vaddq_f64(v7, vsubq_f64(vaddq_f64(v13[0], v6), v7)), v12), v7);
      v13[0] = v7;
      v13[1] = v8;
      PA::Region::Add(this, (const PA::Rect *)v13);
      v4 = *(float64x2_t **)&v4->f64[0];
    }
    while (v4);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v14);
}

void sub_1D4CBE9EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1 - 56);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Clip(PA::Region *this, const PA::Rect *a2)
{
  _BYTE v4[40];

  PA::Region::Region((PA::Region *)v4, a2);
  PA::Region::Clip(this, (const PA::Region *)v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1D4CBEA40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Clip(PA::Region *this, const PA::Region *a2)
{
  uint64_t *i;
  uint64_t *j;
  CGRect v7;
  __int128 v8;
  __int128 v9;
  int v10;
  CGRect v11;

  v8 = 0u;
  v9 = 0u;
  v10 = 1065353216;
  for (i = (uint64_t *)*((_QWORD *)this + 2); i; i = (uint64_t *)*i)
  {
    for (j = (uint64_t *)*((_QWORD *)a2 + 2); j; j = (uint64_t *)*j)
    {
      v11 = CGRectIntersection(*(CGRect *)(i + 2), *(CGRect *)(j + 2));
      if (v11.size.width > 0.0 && v11.size.height > 0.0)
      {
        v7 = v11;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v8, &v7, (uint64_t)&v7);
      }
    }
  }
  if (&v8 != (__int128 *)this)
  {
    *((_DWORD *)this + 8) = v10;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(this, (uint64_t *)v9);
  }
  PA::Region::MergeVertically(this);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v8);
}

void sub_1D4CBEB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Diff(PA::Region *this, const PA::Region *a2)
{
  _QWORD v5[5];

  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  PA::Region::Break(*((_QWORD *)this + 2), (uint64_t)v5);
  PA::Region::Break(*((_QWORD *)a2 + 2), (uint64_t)this);
  PA::Region::Merge(this, v5);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

void sub_1D4CBEB98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1D4CBEC04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBECE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBED34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBED9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBEDF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBEE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBEECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBEF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBEF88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBEFFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBF0B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBF12C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF184(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CBF1E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF230(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF280(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF3D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF408(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF4F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CBF558(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double PFSizeFitAspectInSize(double a1, double a2, double a3)
{
  double v3;

  if (a1 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  v3 = a2 / a3;
  if (a2 / a3 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  if (v3 >= a1 && v3 > a1)
    return floor(a3 * a1);
  return a2;
}

double PFSizeFitAspectInSizeRounded(double a1, double a2, double a3)
{
  double v3;

  if (a1 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  v3 = a2 / a3;
  if (a2 / a3 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  if (v3 >= a1 && v3 > a1)
    return round(a3 * a1);
  return a2;
}

double PFSizeFitAspectInSizeNoRounding(double a1, double a2, double a3)
{
  double v3;

  if (a1 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  v3 = a2 / a3;
  if (a2 / a3 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  if (v3 >= a1 && v3 > a1)
    return a3 * a1;
  return a2;
}

double PFSizeGetScaleToFit(double a1, double a2, double a3, double a4)
{
  double result;
  double v9;
  unint64_t v10;
  double v11;
  double v12;

  if (NSEqualSizes(*(NSSize *)&a1, *MEMORY[0x1E0CB3440]))
  {
    v10 = _PFAssertFailHandler();
    return PFSizeFitSizeInSquare(v10, v11, v12);
  }
  else
  {
    result = a3 / a1;
    v9 = 0.0;
    if (a1 == 0.0)
      result = 0.0;
    if (a2 != 0.0)
      v9 = a4 / a2;
    if (result >= v9)
      return v9;
  }
  return result;
}

double PFSizeFitSizeInSquare(unint64_t a1, double a2, double a3)
{
  double result;

  if (a2 <= 0.0 || a3 <= 0.0)
    return (double)a1;
  result = (double)a1;
  if (a2 <= a3)
    return ceil(a2 / a3 * result);
  return result;
}

double PFSizeFitSizeInSize(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a1 / a2;
  if (v4 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  v5 = a3 / a4;
  if (a3 / a4 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  if (v5 >= v4 && v5 > v4)
    return floor(a4 * v4);
  return a3;
}

double PFSizeConformToAspect(double a1, double a2, double a3)
{
  double v4;
  double v5;
  double v7;
  double v8;
  long double v9;

  v4 = a1;
  v5 = a2 / a1;
  if (v5 != a3)
  {
    v7 = atan(v5);
    v8 = atan(1.0 / a3);
    v9 = sqrt(a2 * a2 + v4 * v4) * cos(v8 - v7);
    return __sincos_stret(v8).__cosval * v9;
  }
  return v4;
}

uint64_t PFSizeRotate(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result >= 0)
    v1 = result;
  else
    v1 = -result;
  if (__ROR8__(0x4FA4FA4FA4FA4FA5 * v1, 1) >= 0x2D82D82D82D82D9uLL)
  {
    v2 = _PFAssertFailHandler();
    return PFSizeEnforceMinDimension(v2);
  }
  return result;
}

double PFSizeEnforceMinDimension(int a1, double a2, double a3, double a4)
{
  return PFSizeEnforceMinDimensions(a1, a2, a3, a4, a4);
}

double PFSizeEnforceMinDimensions(int a1, double result, double a3, double a4, double a5)
{
  double v5;
  double v6;

  if (a1 && result > 0.0 && a3 > 0.0)
  {
    if (result < a4 || a3 < a5)
    {
      v5 = a4 / result;
      v6 = a5 / a3;
      if (v5 < v6)
        v5 = v6;
      return result * v5;
    }
  }
  else if (result < a4)
  {
    return a4;
  }
  return result;
}

double PFSizeEnforceMaxDimension(int a1, double a2, double a3, double a4)
{
  return PFSizeEnforceMaxDimensions(a1, a2, a3, a4, a4);
}

double PFSizeEnforceMaxDimensions(int a1, double result, double a3, double a4, double a5)
{
  double v5;
  double v6;

  if (a1 && result > 0.0 && a3 > 0.0)
  {
    if (result > a4 || a3 > a5)
    {
      v5 = a4 / result;
      v6 = a5 / a3;
      if (v5 >= v6)
        v5 = v6;
      return result * v5;
    }
  }
  else if (result >= a4)
  {
    return a4;
  }
  return result;
}

double PAConvertImageRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11, double a12)
{
  double v20;
  double v21;
  double result;
  CGRect v23;
  CGRect v24;

  v20 = a11 / a7;
  v21 = a12 / a8;
  v23 = CGRectOffset(*(CGRect *)&a1, -a5, -a6);
  v23.origin.x = v20 * v23.origin.x;
  v23.origin.y = v21 * v23.origin.y;
  v23.size.width = v20 * v23.size.width;
  v23.size.height = v21 * v23.size.height;
  v24 = CGRectStandardize(v23);
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v24, a9, a10);
  return result;
}

id PAConvertImageRegion(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v17;

  v17 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v17, "translateBy:", -a2, -a3);
  objc_msgSend(v17, "scaleBy:", a8 / a4, a9 / a5);
  objc_msgSend(v17, "translateBy:", a6, a7);
  return v17;
}

void sub_1D4CBFA38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double PARectVertex(char a1, double a2, double a3, double a4)
{
  if ((a1 & 1) == 0)
    a4 = -0.0;
  return a2 + a4;
}

uint64_t PARectVectexOpposite(int a1)
{
  return a1 ^ 3u;
}

uint64_t PAOrientationTransformRectVertex(uint64_t a1, uint64_t a2)
{
  unsigned int v2;

  switch(a1)
  {
    case 2:
      a2 = a2 ^ 1;
      break;
    case 3:
      a2 = a2 ^ 3;
      break;
    case 4:
      a2 = a2 ^ 2;
      break;
    case 5:
      v2 = ~__rbit32(a2);
      goto LABEL_8;
    case 6:
      a2 = (__rbit32(a2) >> 30) ^ 2;
      break;
    case 7:
      v2 = __rbit32(a2);
LABEL_8:
      a2 = v2 >> 30;
      break;
    case 8:
      a2 = (__rbit32(a2) >> 30) ^ 1;
      break;
    default:
      return a2;
  }
  return a2;
}

double PARectRoundUp(double a1, double a2, double a3, double a4, double a5)
{
  return floor(a1 / a5) * a5;
}

double PARectRoundDown(double a1, double a2, double a3, double a4, double a5)
{
  return ceil(a1 / a5) * a5;
}

double PARelativePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  double result;

  result = 0.0;
  if (a5 != 0.0)
    return (a1 - a3) / a5;
  return result;
}

double PAAbsolutePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double PAPointClipToRect(double a1, double a2, double a3, double a4, double a5)
{
  return fmin(fmax(a1, a3), a3 + a5);
}

double PAAnchorPointFromRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result;

  result = 0.5;
  if (vabdd_f64(a7, a3) > 0.00000011920929)
    return -(a5 - a1) / (a7 - a3);
  return result;
}

double PARectResizeByMovingRelativePoint(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16;

  v16 = a1 + a9 * a3;
  if (a5 != a9)
    a3 = (a1 + a5 * a3 + a7 - v16) / (a5 - a9);
  return v16 - a9 * a3;
}

double PARectEnforceMinimumSizeAndAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v10;

  if (a1 | a2 && a7 * (double)a2 < a8 * (double)a1)
  {
    v9 = (double)a1 / (double)a2;
    v10 = INFINITY;
    if (!a1)
      v10 = NAN;
    if (!a2)
      v9 = v10;
    a7 = a8 * v9;
  }
  return fmin(a3, a3 + a9 * (a5 - a7));
}

BOOL PAAspectRatioIsUndefined(uint64_t a1, uint64_t a2)
{
  return (a1 | a2) == 0;
}

double PAAspectRatioValue(unint64_t a1, unint64_t a2)
{
  double result;
  double v3;

  result = (double)a1 / (double)a2;
  v3 = INFINITY;
  if (!a1)
    v3 = NAN;
  if (!a2)
    return v3;
  return result;
}

double PARectEnforceMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return fmin(a1, a1 + a7 * (a3 - a5));
}

double PARectResizeRelative(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 + a5);
}

double PARectRescaleRelative(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6 * a3 - a6 * (a3 * a5);
}

double PARectRescaleRelativeXY(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 * a5);
}

double PARectAspectConstrain(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  if (a1 | a2)
    return a3
         + a9 * a5
         - a9
         * (((a4 + a8 * a6 - (a4 + a10 * a6)) * ((a8 - a10) * (double)a2)
           + (a3 + a7 * a5 - (a3 + a9 * a5)) * ((a7 - a9) * (double)a1))
          / ((a8 - a10) * (double)a2 * ((a8 - a10) * (double)a2) + (a7 - a9) * (double)a1 * ((a7 - a9) * (double)a1))
          * (double)a1);
  _PFAssertFailHandler();
  return PARectResizeToFitInRect(v21, v22, v23, v24, v25, v26, v27, v28, a11, a12, a13, a14);
}

double PARectResizeToFitInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  return a1
       + a5 * a3
       - a5
       * (a3
        * fmin(fmin((a1 + a5 * a3 - a9) / (a3 * a5), (a9 + a11 - (a1 + a5 * a3)) / (a3 * (1.0 - a5))), fmin((a2 + a6 * a4 - a10) / (a4 * a6), (a10 + a12 - (a2 + a6 * a4)) / (a4 * (1.0 - a6)))));
}

BOOL PAAspectRatioIsEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;

  if (a3 | a4)
    v4 = a4 * a1 == a3 * a2;
  else
    v4 = (a1 | a2 | a3 | a4) == 0;
  if (a1 | a2)
    return v4;
  else
    return (a1 | a2 | a3 | a4) == 0;
}

uint64_t PAAspectRatioWithOrientation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 5) >= 4)
    return a1;
  return a2;
}

unint64_t PAAspectRatioConformWidth(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double v4;
  double v5;

  v4 = (double)a3 / (double)a4;
  v5 = (double)a2;
  if ((double)result / (double)a2 > v4)
    return vcvtmd_u64_f64(v4 * v5);
  if (v5 / (double)result > v4)
    return vcvtpd_u64_f64(v5 / v4);
  return result;
}

double PAAspectRatioConformHeight(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double result;
  double v5;

  result = (double)a3 / (double)a4;
  v5 = (double)a1;
  if ((double)a1 / (double)a2 > result)
    return v5 / result;
  if ((double)a2 / v5 > result)
    return result * v5;
  return result;
}

uint64_t PAAspectRatioCompare(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = (double)a1 / (double)a2;
  v5 = INFINITY;
  if (!a1)
    v5 = NAN;
  if (!a2)
    v4 = v5;
  v6 = (double)a3 / (double)a4;
  v7 = INFINITY;
  if (!a3)
    v7 = NAN;
  if (!a4)
    v6 = v7;
  if (v4 < v6)
    return -1;
  else
    return v4 > v6;
}

double PAExtractRotationFromStraightenAffineTransform(__n128 *a1)
{
  __n128 v1;
  double result;
  __n128 v3[3];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v4 = 0u;
  v5 = 0u;
  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  PADecomposeAffineTransform(v3, (uint64_t)&v4);
  result = *(double *)&v5 * 180.0 / 3.14159265;
  if (result < 0.0)
    return result + 360.0;
  return result;
}

__n128 PADecomposeAffineTransform@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  __n128 result;

  v4 = a1->n128_f64[0];
  v5 = a1->n128_f64[0];
  v6 = a1[1].n128_f64[0];
  v7 = v6;
  v8 = hypotf(v5, v7);
  v9 = a1->n128_f64[1];
  v10 = v9;
  v11 = a1[1].n128_f64[1];
  v12 = v11;
  v13 = hypotf(v10, v12);
  v14 = v4 * v11 - v9 * v6;
  v15 = v14 < 0.0;
  if (v14 <= 0.0)
  {
    v16 = 0.0;
    if (v15)
    {
      if (v4 >= 0.0)
      {
        v19 = -v9 - v6;
        v20 = v4 - v11;
        v16 = atan2f(v19, v20);
        v13 = -v13;
      }
      else
      {
        v17 = v6 + v9;
        v18 = v11 - v4;
        v16 = atan2f(v17, v18);
        v8 = -v8;
      }
    }
  }
  else
  {
    v16 = atan2(v9 - v6, v4 + v11);
  }
  *(double *)a2 = v8;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  result = a1[2];
  *(__n128 *)(a2 + 24) = result;
  return result;
}

double PAConvertCropRectWithStraightenAffineTransform(_OWORD *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  __int128 v11;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double result;
  CGAffineTransform v17;
  CGRect v18;

  v11 = a1[1];
  *(_OWORD *)&v17.a = *a1;
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tx = a1[2];
  *(double *)&v11 = a7;
  v13 = -_PAOffsetFromDGCropToCICropWithTransform(&v17, *(CGSize *)((char *)&v11 - 8));
  v15 = -v14;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v18, v13, v15);
  return result;
}

double _PAOffsetFromDGCropToCICropWithTransform(CGAffineTransform *a1, CGSize a2)
{
  CGFloat height;
  CGFloat width;
  __int128 v4;
  uint64_t v5;
  double result;
  CGAffineTransform v7;
  CGRect v8;

  height = a2.height;
  width = a2.width;
  v4 = *(_OWORD *)&a1->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a1->a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a1->tx;
  v5 = 0;
  *(_QWORD *)&v4 = 0;
  v8 = CGRectApplyAffineTransform(*(CGRect *)(&height - 3), &v7);
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(v8);
  return result;
}

CGFloat PAStraightenAffineTransformWithRadians@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v23;
  CGFloat result;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;

  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v10;
  v11 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)&v28.a = v9;
  *(_OWORD *)&v28.c = v10;
  *(_OWORD *)&v28.tx = v11;
  *(_QWORD *)&v9 = 0;
  *(_QWORD *)&v10 = 0;
  *(CGFloat *)&v11 = a3;
  v12 = a4;
  MidX = CGRectGetMidX(*(CGRect *)&v9);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = a3;
  v29.size.height = a4;
  MidY = CGRectGetMidY(v29);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v28, MidX, MidY);
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.a = *(_OWORD *)a1;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v27, &v26, a2);
  v16 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  v18 = 0;
  *(_QWORD *)&v17 = 0;
  v19 = a3;
  v20 = a4;
  v21 = -CGRectGetMidX(*(CGRect *)((char *)&v17 - 8));
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = a3;
  v30.size.height = a4;
  v22 = CGRectGetMidY(v30);
  CGAffineTransformTranslate(&v27, &v25, v21, -v22);
  v23 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v23;
  result = v27.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  return result;
}

CGFloat PAStraightenAffineTransformWithDegrees@<D0>(uint64_t a1@<X8>, double a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PAStraightenAffineTransformWithRadians(a1, a2 * 3.14159265 / 180.0, a3, a4);
}

void PAConvertCICropRectToDGCropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGSize v18;
  CGRect v19;

  memset(&v17, 0, sizeof(v17));
  PAStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  v16 = v17;
  v18.width = a6;
  v18.height = a7;
  v13 = -_PAOffsetFromDGCropToCICropWithTransform(&v16, v18);
  v15 = -v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectOffset(v19, v13, v15);
}

void PAConvertDGCropRectToCICropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  double v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGSize v18;
  CGRect v19;

  memset(&v17, 0, sizeof(v17));
  PAStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  v16 = v17;
  v18.width = a6;
  v18.height = a7;
  v13 = _PAOffsetFromDGCropToCICropWithTransform(&v16, v18);
  v15 = v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectOffset(v19, v13, v15);
}

double PAConvertCropRectWithAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, 1.0);
}

double _rectWithAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;

  v7 = vcvtmd_u64_f64(sqrt(a6 * (a5 * a7) * (double)a2 / (double)a1) + 0.5);
  v8 = v7 | 1;
  v9 = (v7 & 1) + v7;
  if ((vcvtmd_u64_f64(a6) & 1) != 0)
    v9 = v8;
  v10 = vcvtmd_u64_f64(a5);
  v11 = vcvtmd_u64_f64(floor((double)a1 * (double)v9 / (double)a2) + 0.5);
  v12 = v11 | 1;
  v13 = (v11 & 1) + v11;
  if ((v10 & 1) != 0)
    v13 = v12;
  return a3 - (double)(int)(v13 - v10) * 0.5;
}

double PAConvertCropRectWithAspectRatioAndArea(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, a7 / (a5 * a6));
}

double PACropRectWithCropSizeAndPreferredCenterPoint(double a1, double a2, double a3, double a4, double a5)
{
  double result;
  double v7;
  unint64_t v8;

  result = 0.0;
  if (a3 > 0.0)
  {
    v7 = (double)(unint64_t)a1;
    v8 = (unint64_t)fmin(v7, a3);
    return fmax(fmin((double)v8 * -0.5 + v7 * a5, (double)((unint64_t)a1 - v8)), 0.0);
  }
  return result;
}

__n128 PARecomposeAffineTransform@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __double2 v4;
  double v5;
  double v6;
  __n128 result;

  v4 = __sincos_stret(*(double *)(a1 + 16));
  v5 = *(double *)a1;
  v6 = *(double *)(a1 + 8);
  a2->n128_f64[0] = *(double *)a1 * v4.__cosval;
  a2->n128_f64[1] = v4.__sinval * v6;
  a2[1].n128_f64[0] = -(v5 * v4.__sinval);
  a2[1].n128_f64[1] = v4.__cosval * v6;
  result = *(__n128 *)(a1 + 24);
  a2[2] = result;
  return result;
}

double PAAffineTransformDelta@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  double v3;
  float64x2_t v4;
  double result;
  _OWORD v6[2];
  double v7;

  v3 = a2[2].f64[0] - a1[2].f64[0];
  v4 = vsubq_f64(a2[1], a1[1]);
  v6[0] = vdivq_f64(*a2, *a1);
  v6[1] = v4;
  v7 = v3;
  *(_QWORD *)&result = PAAffineTransformStandardize((uint64_t)v6, a3).n128_u64[0];
  return result;
}

__n128 PAAffineTransformStandardize@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __n128 result;
  __int128 v11;

  v5 = *(double *)a1;
  v4 = *(double *)(a1 + 8);
  if (*(double *)a1 >= 0.0)
  {
    if (v4 >= 0.0)
    {
      v6 = *(double *)(a1 + 16);
      goto LABEL_14;
    }
  }
  else if (v4 < 0.0)
  {
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    v6 = *(double *)(a1 + 16);
    if (v6 > 0.0)
    {
LABEL_12:
      v7 = -3.14159265;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  v6 = *(double *)(a1 + 16);
  if (v6 >= -1.57079633)
  {
    if (v6 <= 1.57079633)
      goto LABEL_14;
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    goto LABEL_12;
  }
  *(double *)a1 = -v5;
  *(double *)(a1 + 8) = -v4;
LABEL_8:
  v7 = 3.14159265;
LABEL_13:
  v6 = v6 + v7;
  *(double *)(a1 + 16) = v6;
LABEL_14:
  v8 = -3.14159265;
  if (v6 <= -3.14159265)
  {
    v9 = 3.14159265;
    goto LABEL_18;
  }
  v8 = 3.14159265;
  if (v6 > 3.14159265)
  {
    v9 = -3.14159265;
LABEL_18:
    *(long double *)(a1 + 16) = fmod(v6 + v8, 6.28318531) + v9;
  }
  result = *(__n128 *)a1;
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t PAAffineTransformOrientation(double *a1)
{
  double v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *a1;
  v2 = 4;
  if (a1[1] < 0.0)
  {
    v3 = v1 < 0.0;
  }
  else
  {
    v2 = 1;
    v3 = 0;
  }
  v4 = (uint64_t)llround(a1[2] * 180.0 / 3.14159265) / 90;
  v5 = v4 & 3;
  v6 = 2;
  if (v3)
    v6 = 3;
  v7 = -v4;
  v3 = v7 < 0;
  v8 = v7 & 3;
  if (v3)
    v9 = v5;
  else
    v9 = -v8;
  if (v1 >= 0.0)
    v10 = v2;
  else
    v10 = v6;
  return IPAOrientationConcat(qword_1D4CCD568[v9 + 3], v10);
}

uint64_t NSStringFromPAAffineTransform(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PAAffineTransform:[scale: %0.2f, %0.2f; translation: %0.2f, %0.2f; rotation: %0.2f]"),
           *a1,
           a1[1],
           a1[3],
           a1[4],
           a1[2]);
}

void sub_1D4CC0A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC0ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC0CC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t NSStringFromPFIntPoint(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), a1, a2);
}

uint64_t IPAOrientationFromClockwiseRotation(uint64_t a1)
{
  uint64_t v1;

  if (a1 / -90 >= 0)
    v1 = -((a1 / -90) & 3);
  else
    v1 = (a1 / 90) & 3;
  return qword_1D4CCD568[v1 + 3];
}

uint64_t IPAOrientationFromClockwiseRotationAndFlip(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 / -90 >= 0)
    v3 = -((a1 / -90) & 3);
  else
    v3 = (a1 / 90) & 3;
  v4 = qword_1D4CCD568[v3 + 3];
  v5 = 2;
  if ((a2 & a3) != 0)
    v5 = 3;
  v6 = 4;
  if (!a3)
    v6 = 1;
  if (a2)
    v7 = v5;
  else
    v7 = v6;
  return IPAOrientationConcat(v4, v7);
}

uint64_t IPAOrientationConcat(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if ((unint64_t)(a1 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    _PFAssertFailHandler();
  }
  else if ((unint64_t)(a2 - 9) > 0xFFFFFFFFFFFFFFF7)
  {
    return IPAOrientationConcat_m[8 * a1 - 9 + a2];
  }
  v3 = _PFAssertFailHandler();
  return IPAOrientationToClockwiseRotation(v3);
}

uint64_t IPAOrientationToClockwiseRotation(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 5)
    return 0;
  else
    return dword_1D4CCD5A0[a1 - 3];
}

uint64_t IPAOrientationInverse(uint64_t a1)
{
  uint64_t v1;

  v1 = 6;
  if (a1 != 8)
    v1 = a1;
  if (a1 == 6)
    return 8;
  else
    return v1;
}

double IPAOrientationTransformImageSize(uint64_t a1, double a2, double a3)
{
  if ((unint64_t)(a1 - 5) >= 4)
    return a2;
  return a3;
}

uint64_t IPAOrientationTransformIntegralImageSize(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((unint64_t)(a1 - 5) >= 4)
    return (int)(double)a2;
  else
    return (int)(double)a3;
}

double IPAOrientationTransformVector(uint64_t a1, double result, double a3)
{
  switch(a1)
  {
    case 2:
      result = -result;
      break;
    case 3:
      result = -result;
      break;
    case 5:
      result = -a3;
      break;
    case 6:
      result = a3;
      break;
    case 7:
      result = a3;
      break;
    case 8:
      result = -a3;
      break;
    default:
      return result;
  }
  return result;
}

double IPAOrientationTransformImageRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  switch(a1)
  {
    case 2:
      a4 = a2 - (a4 + a6);
      break;
    case 3:
      a4 = a2 - (a4 + a6);
      break;
    case 5:
      a4 = a3 - (a5 + a7);
      break;
    case 6:
      a4 = a5;
      break;
    case 7:
      a4 = a5;
      break;
    case 8:
      a4 = a3 - (a5 + a7);
      break;
    default:
      return a4;
  }
  return a4;
}

uint64_t IPAOrientationMakeTransformWithSize@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  switch(result)
  {
    case 2:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0x3FF0000000000000;
      *(double *)(a2 + 32) = a3;
      goto LABEL_11;
    case 3:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      return result;
    case 4:
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = 0x3FF0000000000000;
      *(_OWORD *)(a2 + 24) = xmmword_1D4CCD140;
      *(double *)(a2 + 40) = a4;
      return result;
    case 5:
      *(_OWORD *)a2 = xmmword_1D4CCD130;
      *(_OWORD *)(a2 + 16) = xmmword_1D4CCD140;
      *(double *)(a2 + 32) = a4;
      *(double *)(a2 + 40) = a3;
      return result;
    case 6:
      *(_OWORD *)a2 = xmmword_1D4CCD130;
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
      *(double *)(a2 + 40) = a3;
      return result;
    case 7:
      *(_OWORD *)a2 = xmmword_1D4CCD100;
      *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 24) = 0;
      goto LABEL_9;
    case 8:
      *(_OWORD *)a2 = xmmword_1D4CCD100;
      *(_OWORD *)(a2 + 16) = xmmword_1D4CCD140;
      *(double *)(a2 + 32) = a4;
LABEL_11:
      *(_QWORD *)(a2 + 40) = 0;
      return result;
    default:
      *(_QWORD *)a2 = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0x3FF0000000000000;
LABEL_9:
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      return result;
  }
}

__CFString *IPAOrientationName(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 - 1) >= 8)
    v1 = 0;
  else
    v1 = a1;
  return IPAOrientationName_names[v1];
}

BOOL IPAOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

uint64_t IPAOrientationHasFlip(unint64_t a1)
{
  return (a1 < 8) & (0xB4u >> a1);
}

void sub_1D4CC1BA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC1E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC21F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;
  void *v31;

  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CC25F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;
  uint64_t v34;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v34 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4CC26F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1593(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1594(uint64_t a1)
{

}

void sub_1D4CC2994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CC2A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4CC2B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC2C2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t NSStringFromPFIntSize(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lu, %lu}"), a1, a2);
}

void sub_1D4CC38EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC39E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC3BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void PA::Matrix4d::MultiplyWithProject(double *a1, __n128 a2, double a3)
{
  double v3;
  PA::Quad2d *v4;
  const Vector2d *v5;
  __n128 v6;
  double v7;
  uint64_t v8;

  v6 = a2;
  v7 = a3;
  v8 = 0x3FF0000000000000;
  PA::operator*(a1, v6.n128_f64);
  if (v3 == 0.0)
  {
    v4 = (PA::Quad2d *)_PFAssertFailHandler();
    PA::Quad2d::simpleContains(v4, v5);
  }
}

uint64_t PA::Quad2d::simpleContains(PA::Quad2d *this, const Vector2d *a2)
{
  _BOOL4 v4;
  const Vector2d *v5;
  _BOOL4 v6;
  const Vector2d *v7;
  _BOOL4 v8;
  const Vector2d *v9;

  v4 = PA::Quad2d::simpleContains(this, a2, a2->X, a2->Y);
  v6 = PA::Quad2d::simpleContains(this, v5, a2[1].X, a2[1].Y);
  v8 = PA::Quad2d::simpleContains(this, v7, a2[2].X, a2[2].Y);
  return (v4 && v6) & v8 & PA::Quad2d::simpleContains(this, v9, a2[3].X, a2[3].Y);
}

BOOL PA::Quad2d::simpleContains(PA::Quad2d *this, const Vector2d *a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double v9;
  _OWORD v11[5];
  uint64_t v12;

  v4 = 0;
  v5 = 0;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = *((_OWORD *)this + 1);
  v11[0] = *(_OWORD *)this;
  v11[1] = v6;
  v7 = *((_OWORD *)this + 2);
  v11[2] = *((_OWORD *)this + 3);
  v11[3] = v7;
  v11[4] = v11[0];
  v8 = *((double *)v11 + 1);
  do
  {
    v9 = v8;
    v8 = *((double *)&v11[v4 + 1] + 1);
    if (v9 <= a4)
    {
      if (v8 > a4
        && (*(double *)&v11[v4 + 1] - *(double *)&v11[v4]) * (a4 - v9) - (v8 - v9) * (a3 - *(double *)&v11[v4]) >= 0.0)
      {
        ++v5;
      }
    }
    else if (v8 <= a4)
    {
      v5 -= (*(double *)&v11[v4 + 1] - *(double *)&v11[v4]) * (a4 - v9) - (v8 - v9) * (a3 - *(double *)&v11[v4]) <= 0.0;
    }
    ++v4;
  }
  while (v4 != 4);
  return v5 != 0;
}

void PA::centerRectFinder::~centerRectFinder(PA::centerRectFinder *this)
{
  JUMPOUT(0x1D82668A8);
}

double PA::centerRectFinder::constructNextRect(PA::centerRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return *((double *)this + 1)
       - *((double *)this + 3) * (a3->size.height + (a2->size.height - a3->size.height) * 0.5) * 0.5;
}

BOOL PA::centerRectFinder::converged(PA::centerRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

void sub_1D4CC43C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double PFPointInterpolate(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;

  v5 = 1.0;
  if (a5 <= 1.0)
    v5 = a5;
  if (a5 >= 0.0)
    v6 = v5;
  else
    v6 = 0.0;
  return a1 - (a1 - a3) * v6;
}

double PFPointMapToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  return a9 + a11 * ((a1 - a3) / a5);
}

const __CFString *NSStringFromEditSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E986E188[a1 - 1];
}

BOOL IPAEditSourceIsForMaster(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

#error "1D4CC7214: call analysis failed (funcsize=22)"

id PANSAffineTransformWithCGAffineTransform(_OWORD *a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  objc_msgSend(v2, "setTransformStruct:", v5);
  return v2;
}

BOOL CGAffineTransformIsValid(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2] != 0.0;
}

double CGAffineTransformDeterminant(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2];
}

double CGAffineTransformDot(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3];
}

float64x2_t CGAffineTransformSubstract@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3;
  float64x2_t result;

  v3 = vsubq_f64(a1[1], a2[1]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = v3;
  result = vsubq_f64(a1[2], a2[2]);
  a3[2] = result;
  return result;
}

double CGAffineTransformRoot(double *a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;
  double v10;

  v1 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v3 = a1[3];
  v5 = *a1 * v3 - v2 * v4;
  if (v5 != 0.0)
    return (v4 * a1[5] - v3 * a1[4]) / v5;
  if (v1 == 0.0 && v4 == 0.0)
  {
    if (v2 == 0.0)
    {
      return 0.0;
    }
    else if (a1[4] == 0.0)
    {
      return -a1[5] / v2;
    }
    else
    {
      return 0.0;
    }
  }
  else if (v2 == 0.0 && v3 == 0.0)
  {
    result = 0.0;
    if (a1[5] == 0.0)
    {
      result = -a1[4] / v1;
      if (v1 == 0.0)
        return 0.0;
    }
  }
  else
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = v2 * v7;
    v10 = v7 * v3;
    result = -v7 / v1;
    if (v8 * v4 != v10)
      result = 0.0;
    if (v9 != v1 * v8)
      return 0.0;
  }
  return result;
}

double CGAffineTransformFixedPoint(float64x2_t *a1)
{
  float64x2_t v1;
  _OWORD v3[3];

  v1 = vsubq_f64(a1[1], *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16));
  v3[0] = vsubq_f64(*a1, *MEMORY[0x1E0C9BAA8]);
  v3[1] = v1;
  v3[2] = vsubq_f64(a1[2], *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32));
  return CGAffineTransformRoot((double *)v3);
}

BOOL CGAffineTransformHasRotation(double *a1)
{
  return *a1 < 0.0 || a1[1] != 0.0 || a1[2] != 0.0 || a1[3] < 0.0;
}

CGAffineTransform *CGAffineTransformMove@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a3, a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, -a5, -a6);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  t1 = v16;
  v10 = a1[1];
  *(_OWORD *)&v12.a = *a1;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = a1[2];
  CGAffineTransformConcat(&v14, &t1, &v12);
  t1 = v15;
  return CGAffineTransformConcat((CGAffineTransform *)a2, &v14, &t1);
}

id NSStringFromAffineTranform(_OWORD *a1)
{
  __int128 v1;
  void *v2;
  void *v3;
  _OWORD v5[3];

  v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = a1[2];
  PANSAffineTransformWithCGAffineTransform(v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

CGFloat CGAffineTransformForMappingFromRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGFloat result;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v16 = MEMORY[0x1E0C9BAA8];
  v17 = *MEMORY[0x1E0C9BAA8];
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)&v26.a = v17;
  *(_OWORD *)&v26.c = v18;
  *(_OWORD *)&v26.tx = v19;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v26, a6, a7);
  v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v20;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v26, &v25, a8 / a4, a9 / a5);
  v21 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v21;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v26, &v25, -a2, -a3);
  v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v23;
  result = v26.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

__n128 CGAffineTransformRelative@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4CC7A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1996(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1997(uint64_t a1)
{

}

void sub_1D4CC7EA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC7F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4CC800C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC81E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC85B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC86C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC8890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4CC89F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4CC8AA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1E0C9F340](retstr, t, fromRange, toRange);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

BOOL NSContainsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB28C8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1E0CB29B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1E0CB29C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSRect result;

  MEMORY[0x1E0CB2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSRect NSIntegralRect(NSRect aRect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB2C48]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x1E0CB2C60]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1E0CB2C90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSRect NSOffsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSRect result;

  MEMORY[0x1E0CB2FC8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x1E0CB3030]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1E0C9A0D8]();
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1E0D71158]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1E0D71160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E986D598(__p);
}

uint64_t operator delete()
{
  return off_1E986D5A0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E986D5A8(__sz);
}

uint64_t operator new()
{
  return off_1E986D5B0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

