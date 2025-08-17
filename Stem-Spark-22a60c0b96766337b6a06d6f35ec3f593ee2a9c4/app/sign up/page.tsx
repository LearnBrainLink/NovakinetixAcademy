"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";

export default function SignUpRedirect() {
  const router = useRouter();

  useEffect(() => {
    // Redirect to the new signup page
    router.replace("/signup");
  }, [router]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-900 via-purple-900 to-pink-900">
      <div className="text-center text-white">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
        <p className="text-lg">Redirecting to signup page...</p>
      </div>
    </div>
  );
}
