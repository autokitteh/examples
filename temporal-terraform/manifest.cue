package temporal_terraform

import "encoding/json"

import "autokitteh.io/manifest"

manifest.#Manifest & {
	projects: {
		"temporal.terraform": {
			main_path: "github:autokitteh/examples/temporal-terraform/auto.kitteh"
			plugins: {
				"autokitteh.aws": {}
			}
			src_bindings: {
				"http": {
					src_id:     "internal.http"
					assoc:      "temporal.terraform.http"
					src_config: json.Marshal({
						name: "terraform"
						routes: [
							{
								name: "catchall"
								path: "*"
							},
						]
					})
				}
			}
		}
	}
}
