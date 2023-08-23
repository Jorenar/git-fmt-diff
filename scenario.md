### Example

Let's say we have the following, clearly badly formatted C code:
```c
#include <stdio.h>

int
foo() {
    int x;
  x = printf("Hello World!\n");

  if( x == 1) {
  return -1;
    }

        return 5;
}

/* TODO: implement bar() */
int bar() { return 8;
}

int main()
{ int r;
    int f = foo();

int b = bar();

    r = f +   b;

    return(0 ); }
```

After 30 years you are at least to resolve the TODO;  
but contrary to your predecessors you want to adhere to some sane coding style.

So you edit the file as follows:
```c
#include <stdio.h>
#include <stdlib.h>

int
foo() {
    int x;
  x = printf("Hello World!\n");

  if( x == 1) {
  return -1;
    }

        return 5;
}

int bar(int n)
{
    char* x = malloc(n * (sizeof *x));
    int y =sprintf(x, "Bar is now open!");
    free(x);
    return y; }

int main()
{ int r;
    int f = foo();

int b = bar(8);

    r = f +   b;

    return(0 ); }
```

Let's see how a `$ git diff` looks like:
```diff
diff --git a/hello.c b/hello.c
index c83a8c1..74337f8 100644
--- a/hello.c
+++ b/hello.c
@@ -1,4 +1,5 @@
 #include <stdio.h>
+#include <stdlib.h>

 int
 foo() {
@@ -12,15 +13,18 @@ foo() {
         return 5;
 }

-/* TODO: implement bar() */
-int bar() { return 8;
-}
+int bar(int n)
+{
+    char* x = malloc(n * (sizeof *x));
+    int y =sprintf(x, "Bar is now open!");
+    free(x);
+    return y; }

 int main()
 { int r;
     int f = foo();

-int b = bar();
+int b = bar(8);

     r = f +   b;

```

Nice, it doesn't look half as bad as other functions.  
But perhaps made some stylistic mistakes found their way into your code anyway
and you'd want to check it.  
That's where `$ git fmt-diff` enters the stage:
```diff
diff --git a/hello.c b/hello.c
index 74337f8..7a6d3fd 100644
--- a/hello.c
+++ b/hello.c
@@ -15,16 +15,17 @@ foo() {
 
 int bar(int n)
 {
-    char* x = malloc(n * (sizeof *x));
-    int y =sprintf(x, "Bar is now open!");
+    char *x = malloc(n * (sizeof *x));
+    int y = sprintf(x, "Bar is now open!");
     free(x);
-    return y; }
+    return y;
+}
 
 int main()
 { int r;
     int f = foo();
 
-int b = bar(8);
+    int b = bar(8);
 
     r = f +   b;
 
```

As you can see, only added or modified lines got suggestions for reformatting.
On top of that, even added lines which were already conforming to style didn't
show up here either. Now you can decide whether to apply suggestions or commit
the file in its current state.

If you reviewed suggestions and think all of them are an improvement,
you can just rerun the command piping to `git apply`:
```sh
$ git fmt-diff | git apply
```

Your changes will be formatted and ready to merge:
```c
#include <stdio.h>
#include <stdlib.h>

int
foo() {
    int x;
  x = printf("Hello World!\n");

  if( x == 1) {
  return -1;
    }

        return 5;
}

int bar(int n)
{
    char* x = malloc(n * (sizeof *x));
    int y = sprintf(x, "Bar is now open!");
    free(x);
    return y;
}

int main()
{ int r;
    int f = foo();

    int b = bar(8);

    r = f +   b;

    return(0 ); }
```
