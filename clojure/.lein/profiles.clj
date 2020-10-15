{:user
 {:plugins [[lein-ancient "0.6.15"]
            ;; [lein-ubersource "0.1.1"]
            ]
  ;; :resource-paths ["~/.java-src/java-11-openjdk"]
  }}

{:repl
 {:plugins [[cider/cider-nrepl "0.25.3-SNAPSHOT"]
            [refactor-nrepl "2.5.0"]

            ;; [com.billpiel/sayid "0.0.18"]
            ]
  :repl-options
  ;; {:nrepl-middleware [com.billpiel.sayid.nrepl-middleware/wrap-sayid]}
  }}

;; {:dev {:dependencies [[org.clojure/tools.nrepl "0.2.13"]]}}
{:dev
 {:dependencies [[org.clojure/clojurescript "1.10.339"]
                 [com.bhauman/figwheel-main "0.2.3"]]}}
